# This script completes trip generation using a parcel input for aggregation to any zone system
# Spatial joins for block, taz and parcel inputs are all performed programatically using geopandas
# Created by Puget Sound Regional Council Staff
# March 2018

import ast
import h5py
import pandas as pd
from pandas import *
import time
import numpy as np
from trip_gen_inputs import *
from shapely.geometry import Point
import geopandas as gp
import sqlite3

# Function to create a datframe from the H5 files from Urbansim
def create_df_from_h5(h5_file, h5_table, h5_variables):

    h5_data = {}
    
    for var in h5_variables:
        h5_data[var] = h5_file[h5_table][var][:]
    
    return pd.DataFrame(h5_data)

# Function to adjust trips using a set of adjustment factors
def adjust_trips(working_df, regional_adjustments, kitsap_adjustments):
        
    for purposes in regional_adjustments:
        working_df[purposes[0]] = working_df[purposes[0]] * purposes[1]
        
    for purposes in kitsap_adjustments:
        working_df[purposes[0]] = working_df[purposes[0]] + (working_df[purposes[0]] * purposes[1] * working_df['Kitsap-Flag'])
    
    return working_df

# Function to balance trips to either productions or attractions
def balance_trips(working_df, trip_purposes, balanced_to):
    
    if balanced_to == 'pro':
        to_balance = 'att'
        
    else:
        to_balance = 'pro'
        
    for purposes in trip_purposes:
        total_to_match = sum(working_df[purposes+balanced_to])
        total_to_balance = sum(working_df[purposes+to_balance])
        ratio = total_to_match / total_to_balance
        working_df[purposes+to_balance] = working_df[purposes+to_balance] * ratio
    
    return working_df

# Function to create trip productions and attraction files to read into Emme
def create_emme_vectors(working_df, trip_types, matrix_type):
    
    matrix_start = 1
    
    for purposes in trip_types:
        working_file = open(output_directory+'/'+purposes[0]+'.in', "w")
        working_file.write('c ' + str(model_year) + ' Trip Generation' + '\n')
        working_file.write('c Trip Generation is based on '+ land_use_product + ' using the '+ taz_system + '\n')
        working_file.write('t matrices' + '\n')
        working_file.write('a matrix=' + matrix_type + str(matrix_start) + ' ' + purposes[0] + ' 0 ' + purposes[1] + '\n')
        
        for rows in range(0, (len(working_df))):
            
            current_zone = int(working_df['TAZ'][rows])
            
            if matrix_type == 'mo':
                working_file.write(' '+str(current_zone) + ' all: ' + str(working_df[purposes[0]][rows]) + '\n')
            
            elif matrix_type == 'md':
                working_file.write(' all '+str(current_zone) + ': ' + str(working_df[purposes[0]][rows]) + '\n')
            
        working_file.close()
        matrix_start += 1

def gp_join(target_layer,join_shapefile,coord_sys,keep_columns):
    
    # open join shapefile as a geodataframe
    join_layer = gp.GeoDataFrame.from_file(join_shapefile)
    join_layer.crs = {'init' :coord_sys}

    # spatial join
    merged = gp.sjoin(target_layer, join_layer, how = "inner", op='intersects')
    merged = pd.DataFrame(merged)
    merged = merged[keep_columns]
    
    return merged

def create_point_from_polygon(polygon_shape,coord_sys):
    poly = gp.read_file(polygon_shape)
    points = poly.copy()
    points.geometry = points['geometry'].centroid
    points.crs = {'init' :coord_sys}
    
    # create a geodataframe for points and return
    geo_layer = gp.GeoDataFrame(points, geometry='geometry')
    geo_layer.crs = {'init' :coord_sys}
    
    return geo_layer

def create_point_from_table(current_df,x_coord,y_coord,coord_sys):
    current_df['geometry'] = current_df.apply(lambda x: Point((float(x[x_coord]), float(x[y_coord]))), axis=1)
    geo_layer = gp.GeoDataFrame(current_df, geometry='geometry')
    geo_layer.crs = {'init' :coord_sys}
    
    return geo_layer

start_of_production = time.time()

###########################################################
###########################################################
### General File Opening and Spatial Connections
###########################################################
###########################################################

# Connect to the Trip Generation Database of input files
model_inputs_db = sqlite3.connect(model_files)

# Spatial Join Blocks and TAZ Layers to create a block/taz equivalency
keep_columns = ['GEOID10','TAZ']
block_layer = create_point_from_polygon(block_shapefile,state_plane)
merged_blocks = gp_join(block_layer,taz_shapefile,state_plane,keep_columns)

# Setup Parcel file and remove unwanted columns for trip generation usage
# Since titels can case, just make sure things are all caps
parcels = pd.read_csv(parcel_file, sep = ' ')
parcels.columns = parcels.columns.str.upper()
parcels = parcels.loc[:,original_parcel_columns]
parcels.columns = updated_parcel_columns

# Add the TAZ Field to the Parcel Records and merge with the employment inputs
keep_columns = ['Parcel-ID','TAZ']
parcels_layer = create_point_from_table(parcels,'XCoord','YCoord',state_plane)
taz_parcels = gp_join(parcels_layer,taz_shapefile,state_plane,keep_columns)
df_parcels = pd.merge(taz_parcels,parcels,on='Parcel-ID',suffixes=('_x','_y'),how='left')
df_parcels = df_parcels.drop('geometry',axis=1)

# Open HH and Person H5 file and create dataframes from them
hh_people = h5py.File(hh_person,'r+') 
hh_df = create_df_from_h5(hh_people, 'Household', hh_variables)
person_df = create_df_from_h5(hh_people, 'Person', person_variables)

###########################################################
###########################################################
### Group Quarters
###########################################################
###########################################################

# Open Group Quarters tables from the Input DB into dataframes
total_gq_df = pd.read_sql_query("SELECT * FROM total_gq", model_inputs_db)
dorm_share_df = pd.read_sql_query("SELECT * FROM dorm_shares", model_inputs_db)
dorm_share_df.rename(columns={'Share': 'Dorm-Shares'}, inplace=True)
military_share_df = pd.read_sql_query("SELECT * FROM military_shares", model_inputs_db)
military_share_df.rename(columns={'Share': 'Military-Shares'}, inplace=True)

# Merge the dataframes to create one working dataframe
total_gq_df = total_gq_df.merge(dorm_share_df,on='GEOID10').merge(military_share_df,on='GEOID10')
total_gq_df['Dorm-Shares'] = total_gq_df['Dorm-Shares'].apply(float)
total_gq_df['Military-Shares'] = total_gq_df['Military-Shares'].apply(float)

# Calculate the Inputs for the Year of the model
data_years = total_gq_df.columns[total_gq_df.columns.str.isnumeric()]
max_input_year = int(max(data_years))

if model_year <= max_input_year:
    
    total_gq_df['Model-Year'] = total_gq_df[str(model_year)]
    total_gq_df['Model-Year'] = total_gq_df['Model-Year'].apply(float)
    total_gq_df['Dorms'] = total_gq_df['Model-Year'] * total_gq_df['Dorm-Shares']
    total_gq_df['Military'] = total_gq_df['Model-Year'] * total_gq_df['Military-Shares']
    total_gq_df['Other'] = total_gq_df['Model-Year'] - total_gq_df['Dorms'] - total_gq_df['Military']
        
elif model_year > max_input_year:
    total_gq_df['Model-Year'] = total_gq_df[str(max_input_year)]
    total_gq_df['Model-Year'] = total_gq_df['Model-Year'].apply(float)    
    total_gq_df['Model-Year'] = total_gq_df['Model-Year'] * (1+(group_quarters_rate*(model_year-max_input_year)))
    total_gq_df['Dorms'] = total_gq_df['Model-Year'] * total_gq_df['Dorm-Shares']
    total_gq_df['Military'] = total_gq_df['Model-Year'] * total_gq_df['Military-Shares']
    total_gq_df['Other'] = total_gq_df['Model-Year'] - total_gq_df['Dorms'] - total_gq_df['Military']
    
# Merge with the Block/Taz dataframe and trim down the columns
keep_columns = ['GEOID10','TAZ','Dorms','Military','Other']
total_gq_df['GEOID10'] = total_gq_df['GEOID10'].apply(str)
gq_blocks = pd.merge(merged_blocks,total_gq_df,on='GEOID10',suffixes=('_x','_y'),how='left')
gq_blocks = gq_blocks.loc[:,keep_columns]

# Read in rates and calculate Total Group Quarters related trips
df_gq_rates = pd.read_csv(gq_rates,header=0)
df_gq_rates.set_index('GQ-Category', inplace=True)

for purpose in trip_productions:
    gq_blocks[purpose] = gq_blocks['Dorms'] * df_gq_rates.loc['Dorms',purpose] + gq_blocks['Military'] * df_gq_rates.loc['Military',purpose] + gq_blocks['Other'] * df_gq_rates.loc['Other',purpose]

# Consolidate Group Quarters data to TAZ for output to travel model
df_gq_taz = gq_blocks.groupby('TAZ').sum()
df_gq_taz = df_gq_taz.reset_index()
df_gq_taz.set_index('TAZ', inplace=True)
df_gq_taz = df_gq_taz.loc[:,trip_productions]

###########################################################
###########################################################
### Enlisted Personnel
###########################################################
###########################################################

# Open Group Quarters tables from the Input DB into dataframe
df_enlisted = pd.read_sql_query("SELECT * FROM enlisted_personnel", model_inputs_db)
df_enlisted['GEOID10'] = df_enlisted['GEOID10'].apply(str)
enlisted_blocks = pd.merge(merged_blocks,df_enlisted,on='GEOID10',suffixes=('_x','_y'),how='left')
enlisted_blocks.fillna(0,inplace=True)

# Calculate the Inputs for the Year of the model
data_years = enlisted_blocks.columns[enlisted_blocks.columns.str.isnumeric()]
max_input_year = int(max(data_years))

if model_year <= max_input_year:
    
    enlisted_blocks['Model-Year'] = enlisted_blocks[str(model_year)]
    enlisted_blocks['Model-Year'] = enlisted_blocks['Model-Year'].apply(float)
        
elif model_year > max_input_year:
    enlisted_blocks['Model-Year'] = enlisted_blocks[str(max_input_year)]
    enlisted_blocks['Model-Year'] = enlisted_blocks['Model-Year'].apply(float)    
    enlisted_blocks['Model-Year'] = enlisted_blocks['Model-Year'] * (1+(enlisted_personnel_rate*(model_year-max_input_year)))

# Trim Down the Dataframe to only include 
keep_columns = ['GEOID10','TAZ','Model-Year']
enlisted_blocks = enlisted_blocks.loc[:,keep_columns]

# Read in rates and calculate Enlisted Personnel related trips by Purpose
df_enlisted_rates = pd.read_csv(enlisted_rates,header=0)
df_enlisted_rates.set_index('Trips', inplace=True)

for purpose in trip_attractions:
    enlisted_blocks[purpose] = enlisted_blocks['Model-Year'] * df_enlisted_rates.get_value('Enlisted',purpose)

# Consolidate Enlisted Personnel data to TAZ
enlisted_blocks_taz = enlisted_blocks.groupby('TAZ').sum()
enlisted_blocks_taz = enlisted_blocks_taz.reset_index()
enlisted_blocks_taz.set_index('TAZ', inplace=True)
enlisted_blocks_taz = enlisted_blocks_taz.loc[:,trip_attractions]

###########################################################
###########################################################
### Special Generators
###########################################################
###########################################################

# Open Special Generator table from the Input DB into dataframe
df_special = pd.read_sql_query("SELECT * FROM special_generators", model_inputs_db)
df_special['GEOID10'] = df_special['GEOID10'].apply(str)
special_blocks = pd.merge(merged_blocks,df_special,on='GEOID10',suffixes=('_x','_y'),how='left')
special_blocks.fillna(0,inplace=True)

# Calculate the Inputs for the Year of the model
data_years = special_blocks.columns[special_blocks.columns.str.isnumeric()]
max_input_year = int(max(data_years))

if model_year <= max_input_year:
    
    special_blocks['Model-Year'] = special_blocks[str(model_year)]
    special_blocks['Model-Year'] = special_blocks['Model-Year'].apply(float)
        
elif model_year > max_input_year:
    special_blocks['Model-Year'] = special_blocks[str(max_input_year)]
    special_blocks['Model-Year'] = special_blocks['Model-Year'].apply(float)    
    special_blocks['Model-Year'] = special_blocks['Model-Year'] * (1+(special_generator_rate*(model_year-max_input_year)))

# Trim Down the Dataframe to only include 
keep_columns = ['GEOID10','TAZ','Model-Year']
special_blocks = special_blocks.loc[:,keep_columns]

# Consolidate Special Generator data to TAZ
special_blocks_taz = special_blocks.groupby('TAZ').sum()
special_blocks_taz = special_blocks_taz.reset_index()
special_blocks_taz.set_index('TAZ', inplace=True)
updated_columns = ['hboatt']
special_blocks_taz.columns = updated_columns

###########################################################
###########################################################
### External Stations
###########################################################
###########################################################

# Open External table from the Input DB into dataframe
df_external = pd.read_sql_query("SELECT * FROM externals", model_inputs_db)
df_external.set_index('TAZ', inplace=True)
df_external = df_external.astype(float)

# Calculate the Inputs for the Year of the model
data_year = int(df_external['year'][0])
       
if model_year > data_year:   
    growth_rate = (1+(external_rate*(model_year-data_year)))
    df_external = df_external * growth_rate

# Trim out the year Column
df_external = df_external.drop('year',axis=1)

###########################################################
###########################################################
### ATRI Heavy Trucks
###########################################################
###########################################################
heavy_trucks = pd.read_csv(heavy_truck_internal_file, sep = ',')
external_trucks = pd.read_csv(heavy_truck_external_file, sep = ',')

# Spatial Join ATRI Zones and TAZ Layers to create a atri/taz equivalency
keep_columns = ['ATRI_Zone','TAZ']
atri_layer = create_point_from_polygon(atri_shapefile,state_plane)
merged_atri = gp_join(atri_layer,taz_shapefile,state_plane,keep_columns)

df_heavy_trucks = pd.merge(heavy_trucks,merged_atri,on='ATRI_Zone',suffixes=('_x','_y'),how='left')
df_heavy_trucks = df_heavy_trucks.groupby('TAZ').sum()

# Make the TAZ field the index
external_trucks.set_index('TAZ', inplace=True)

# Calculate the Inputs for the Year of the model
data_year = int(df_heavy_trucks['year'][1])
       
if model_year > data_year:   
    growth_rate = (1+(truck_rate*(model_year-data_year)))
    df_heavy_trucks = df_heavy_trucks * growth_rate
    external_trucks = external_trucks * growth_rate

# Trim down the columns
remove_columns=['ATRI_Zone','year']
df_heavy_trucks = df_heavy_trucks.drop(remove_columns,axis=1)
external_trucks = external_trucks.drop(remove_columns,axis=1)

# Combine Internal and External ATRI Truck Trips
df_heavy_trucks = df_heavy_trucks.append(external_trucks)

###########################################################
###########################################################
### Household Trip Generation
###########################################################
###########################################################

# Create Person Classifications and group by Houshold ID
person_df['People'] = 1

# Flag if the person has a full or part-time job
person_df['Workers'] = 0
person_df.loc[person_df['pptyp'] == 1, 'Workers'] = 1
person_df.loc[person_df['pptyp'] == 2, 'Workers'] = 1 

# Flag if the person is a school age kid
person_df['School-Age'] = 0
person_df.loc[person_df['pptyp'] == 6, 'School-Age'] = 1
person_df.loc[person_df['pptyp'] == 7, 'School-Age'] = 1   

# Flag if the person is a college student
person_df['College-Student'] = 0
person_df.loc[person_df['pptyp'] == 5, 'College-Student'] = 1
             
# Remove a couple columns
fields_to_remove=['pno','pptyp']
person_df = person_df.drop(fields_to_remove,axis=1)
             
# Create a HH file by grouping the person file by household number 
df_hh = person_df.groupby('hhno').sum()
df_hh = df_hh.reset_index()

# Merge the HH File created from the persons with the original HH file from H5
df_hh = pd.merge(df_hh,hh_df,on='hhno',suffixes=('_x','_y'),how='left')

# Create a Column for Household sizes 1, 2, 3 or 4+
df_hh['Household-Class'] = df_hh['hhsize']
df_hh.loc[df_hh['Household-Class'] > 4, 'Household-Class'] = 4
         
# Create a Column for workers 0, 1, 2 or 3+
df_hh['Worker-Class'] = df_hh['Workers']
df_hh.loc[df_hh['Worker-Class'] > 3, 'Worker-Class'] = 3       

# Create a Column for Income 
df_hh['Income-Class'] = 0
df_hh.loc[df_hh['hhincome'] <= low_income, 'Income-Class'] = 1 
df_hh.loc[(df_hh['hhincome'] > low_income) & (df_hh['hhincome'] <= medium_income), 'Income-Class'] = 2 
df_hh.loc[(df_hh['hhincome'] > medium_income) & (df_hh['hhincome'] <= high_income), 'Income-Class'] = 3         
df_hh.loc[df_hh['hhincome'] > high_income, 'Income-Class'] = 4
         
# Create a Column for school age children 0, 1, 2 or 3+
df_hh['School-Class'] = df_hh['School-Age']
df_hh.loc[df_hh['School-Class'] > 3, 'School-Class'] = 3          

# Create a Column for college age persons 0, 1, 2+ 
df_hh['College-Class'] = df_hh['College-Student']
df_hh.loc[df_hh['College-Class'] > 2, 'College-Class'] = 2          
         
# Create a Columns for Household - Work - Income Cross-Classification, Income & School and Income and College
df_hh['HWI'] = 'H'+ df_hh['Household-Class'].apply(str) + 'W' + df_hh['Worker-Class'].apply(str) + 'I' + df_hh['Income-Class'].apply(str)
df_hh['SI'] = 'S'+ df_hh['School-Class'].apply(str) + 'I' + df_hh['Income-Class'].apply(str)
df_hh['CI'] = 'C'+ df_hh['College-Class'].apply(str) + 'I' + df_hh['Income-Class'].apply(str)

# Load HH Trip Rates into dataframes from csv input files
df_hh_rates = pd.read_csv(hh_rates,header=0)
df_sch_rates = pd.read_csv(sch_rates,header=0)
df_coll_rates = pd.read_csv(coll_rates,header=0)

# Merge Rates with Households by Cross-Classification so we end up with total household productions
df_hh = pd.merge(df_hh,df_hh_rates,on='HWI',suffixes=('_x','_y'),how='left')
df_hh = pd.merge(df_hh,df_sch_rates,on='SI',suffixes=('_x','_y'),how='left')
df_hh = pd.merge(df_hh,df_coll_rates,on='CI',suffixes=('_x','_y'),how='left')

columns_to_keep = ['hbw1pro','hbw2pro','hbw3pro','hbw4pro','colpro','hsppro','schpro','hbopro','otopro','wtopro',
                   'hbw1att','hbw2att','hbw3att','hbw4att','colatt','hspatt','schatt','hboatt','otoatt','wtoatt',
                   'hhparcel','People']

df_hh = df_hh.loc[:,columns_to_keep]
df_hh['Total-HHs'] = 1

# Create a Parcel file by grouping the hh file by parcel ID 
df_parcel_hh_pa = df_hh.groupby('hhparcel').sum()
df_parcel_hh_pa = df_parcel_hh_pa.reset_index()
df_parcel_hh_pa.rename(columns={'hhparcel': 'Parcel-ID','People': 'Population'}, inplace=True)

# Merge the Full Parcel File with Employment inputs with the parcel file from the HH's with P's & A's
df_parcels = pd.merge(df_parcels,df_parcel_hh_pa,on='Parcel-ID',suffixes=('_x','_y'),how='left')
df_parcels.fillna(0,inplace=True)
df_parcels['Education'] = 0
df_parcels['Education'] = df_parcels['K-8'] + df_parcels['High-School']
df_parcels['mtkpro'] = 0
df_parcels['mtkatt'] = 0
df_parcels['cvhpro'] = 0
df_parcels['cvhatt'] = 0

# Trip Attractions based on Employment and Student Inputs by parcel
for purpose in trip_attraction_rates:
                 
    for jobs in purpose[1]:
        df_parcels[purpose[0]] = df_parcels[purpose[0]] + (df_parcels[jobs[0]] * jobs[1])
         
# Sea-Tac Airport Trip Productions and Attractions - based on total population and total jobs
df_parcels['airport'] = (df_parcels['Total-Jobs']*air_jobs) + (df_parcels['Population']*air_people)
aiport_balancing = seatac_enplanements / sum(df_parcels['airport'])
df_parcels['airport'] = df_parcels['airport']*aiport_balancing
          
###########################################################
###########################################################
### Create TAZ Input files
###########################################################
###########################################################

# Create a TAZ File for Productions and Attractions
df_taz = df_parcels.groupby('TAZ').sum()
df_taz = df_taz.reset_index()
df_taz.fillna(0,inplace=True)
fields_to_remove = ['Parcel-ID','XCoord','YCoord','Education','Food-Services','Government','Industrial','Medical','Office','Retail','Resources','Services','Other','K-8','High-School','University','Population','Total-Jobs','Total-HHs']
df_taz = df_taz.drop(fields_to_remove,axis=1)

# Add the County Name to the TAZ Dataframe. 
keep_columns = ['TAZ','COUNTY_NM']
taz_layer = create_point_from_polygon(taz_shapefile,state_plane)
merged_taz = gp_join(taz_layer,county_shapefile,state_plane,keep_columns)
merged_taz.rename(columns={'COUNTY_NM': 'County'}, inplace=True)

# Now merge County name into the TAZ dataframe
df_taz = pd.merge(df_taz,merged_taz,on='TAZ',suffixes=('_x','_y'),how='left')

# Create a Kitsap County flag
df_taz['Kitsap-Flag']=0
df_taz.loc[df_taz['County'] == 'Kitsap', 'Kitsap-Flag'] = 1
df_taz.set_index('TAZ', inplace=True)
df_taz.to_csv(output_directory+'/1_unadjusted_unbalanced.csv',index=True)

# Add in the Group Quarters to Trip Productions   
for purpose in trip_productions:
    df_taz[purpose] = df_taz[purpose] + df_gq_taz[purpose]
df_taz.to_csv(output_directory+'/2_add_group_quarters.csv',index=True)

# Add in the Enlisted Personnel to Trip Attractions
for purpose in trip_attractions:
    df_taz[purpose] = df_taz[purpose] + enlisted_blocks_taz[purpose]
df_taz.to_csv(output_directory+'/3_add_enlisted_personnel.csv',index=True)

# Add in the Special Generators to Trip Attractions
df_taz['hboatt'] = df_taz['hboatt'] + special_blocks_taz['hboatt']
df_taz.to_csv(output_directory+'/4_add_special_generators.csv',index=True)

# Add in the External Trips
df_taz = df_taz.append(df_external)
df_taz.to_csv(output_directory+'/5_add_externals.csv',index=True)

# Add in Heavy Truck Trips
df_taz = df_taz.reset_index()
df_taz.fillna(0,inplace=True)
df_taz['TAZ'] = df_taz['TAZ'].apply(int)
df_heavy_trucks = df_heavy_trucks.reset_index()
df_heavy_trucks.fillna(0,inplace=True)
df_taz = pd.merge(df_taz,df_heavy_trucks,on='TAZ',suffixes=('_x','_y'),how='left')
df_taz.fillna(0,inplace=True)
df_taz.set_index('TAZ', inplace=True)
df_taz.to_csv(output_directory+'/6_add_atri_heavy_trucks.csv',index=True)

# Adjust the taz level data based on trip rate adjustments
adjusted_df = adjust_trips(df_taz, regional_attraction_adjustments, kitsap_attraction_adjustments)
adjusted_df = adjust_trips(df_taz, regional_production_adjustments, kitsap_production_adjustments)
adjusted_df.to_csv(output_directory+'/7_adjust_trip_ends.csv',index=True)

# Balance the taz dataframe
balanced_df = balance_trips(adjusted_df, balance_to_productions, 'pro')
balanced_df = balance_trips(adjusted_df, balance_to_attractions, 'att')
balanced_df.to_csv(output_directory+'/8_balance_trip_ends.csv',index=True)

###########################################################
###########################################################
### Create Emme Input File
###########################################################
###########################################################
balanced_df = balanced_df.reset_index()
balanced_df.fillna(0,inplace=True)

# Create HH Level TAZ Input files for use in Emme
create_emme_vectors(balanced_df,productions_4k,'mo')
create_emme_vectors(balanced_df,attractions_4k,'md')

# Create Airport Input File for use in Emme
working_file = open(output_directory+'/airport.in', "w")
working_file.write('c ' + str(model_year) + ' Trip Generation' + '\n')
working_file.write('c Trip Generation is based on '+ land_use_product + ' using the '+ taz_system + '\n')
working_file.write('t matrices' + '\n')
working_file.write('a matrix=mf' + str(airport_matrix) + ' airport ' + '0 SeaTac Airport Trips' + '\n')
        
for rows in range(0, (len(balanced_df))):
            
    current_zone = balanced_df['TAZ'][rows]
    working_file.write(' '+str(current_zone) + ' ' + str(seatac_zone) + ' : ' + str((balanced_df['airport'][rows])/2) + '\n')
    working_file.write(' '+str(seatac_zone) + ' ' + str(current_zone) + ' : ' + str((balanced_df['airport'][rows])/2) + '\n')         

working_file.close()

end_of_production = time.time()
print 'The Total Time for all processes took', (end_of_production-start_of_production)/60, 'minutes to execute.'
exit()
             