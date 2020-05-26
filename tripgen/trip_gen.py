# This script completes trip generation using a parcel input
# Created by Puget Sound Regional Council Staff
# Updated November 2019

import h5py
import pandas as pd
import time
from trip_gen_inputs import *
import sqlite3
from shapely.geometry import Point
import geopandas as gp
import numpy as np

# Function to create a datframe from the H5 files from Urbansim
def create_df_from_h5(h5_file, h5_table, h5_variables):

    h5_data = {}
    
    for var in h5_variables:
        h5_data[var] = h5_file[h5_table][var][:]
    
    return pd.DataFrame(h5_data)

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
            
            current_zone = int(working_df['taz'][rows])
            
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
### Connect to the Trip Generation Database of input files
###########################################################
###########################################################
print('Opening Model Input Database')
model_inputs_db = sqlite3.connect(model_files)

###########################################################
###########################################################
### Create a full TAZ List for joining (including externals)
###########################################################
###########################################################
print ('Creating zone system dataframe from TAZ Shapefile')
working = gp.read_file(taz_shapefile)
all_taz = working[taz_attribute]
all_taz = all_taz.reset_index()
all_taz  = all_taz.rename(columns={taz_attribute:'taz'})
all_taz = all_taz.drop('index',axis=1)

# Create Externals and join to internal TAZ list
all_externals = pd.DataFrame.from_dict(external_ids,orient='index',columns=['taz'])
all_taz = all_taz.append(all_externals,sort=True)
all_taz = all_taz.reset_index()
all_taz = all_taz.drop('index',axis=1)

###########################################################
###########################################################
### TAZ to Block
###########################################################
###########################################################
print('Spatial Join Blocks and TAZ Layers to create a block/taz equivalency')
keep_columns = ['GEOID10',taz_attribute]
block_layer = create_point_from_polygon(block_shapefile,state_plane)
merged_blocks = gp_join(block_layer,taz_shapefile,state_plane,keep_columns)
merged_blocks  = merged_blocks.rename(columns={taz_attribute:'taz'})
merged_blocks.columns = merged_blocks.columns.str.lower()

###########################################################
###########################################################
### TAZ to Parcels
###########################################################
###########################################################
print('Spatial Join Parcels and TAZ Layers to create a parcel/taz equivalency')
parcels = pd.read_csv(parcel_file, sep = ' ')
parcels.columns = parcels.columns.str.lower()
parcels = parcels.loc[:,original_parcel_columns]
parcels.columns = updated_parcel_columns

# Add the TAZ Field to the Parcel Records and merge with the employment inputs
keep_columns = ['parcel-id',taz_attribute]
parcels_layer = create_point_from_table(parcels,'xcoord','ycoord',state_plane)
taz_parcels = gp_join(parcels_layer,taz_shapefile,state_plane,keep_columns)
df_parcels = pd.merge(taz_parcels,parcels,on='parcel-id',suffixes=('_x','_y'),how='left')
df_parcels = df_parcels.drop('geometry',axis=1)
df_parcels  = df_parcels.rename(columns={taz_attribute:'taz'})
df_parcels.columns = df_parcels.columns.str.lower()

###########################################################
###########################################################
### Household and Person File
###########################################################
###########################################################
hh_people = h5py.File(hh_person,'r+') 
hh_df = create_df_from_h5(hh_people, 'Household', hh_variables)
person_df = create_df_from_h5(hh_people, 'Person', person_variables)

###########################################################
###########################################################
### Auto External Stations
###########################################################
###########################################################
print ('Creating auto external data by taz')
working = pd.read_sql_query("SELECT * FROM auto_externals", model_inputs_db)
working = working.astype(int)

# Replace External Zone Numbers with Updated Zone System
working['taz'] = working['taz'].replace(external_ids)

# Calculate the Inputs for the Year of the model
data_year = int(working['year'][0])
       
if model_year > data_year:   
    growth_rate = (1+(external_rate*(model_year-data_year)))
    working = working * growth_rate

# Join with Full TAZ list and clean up
df_external = pd.merge(all_taz,working,on='taz',suffixes=('_x','_y'),how='left')
df_external.fillna(0,inplace=True)
df_external = df_external.loc[:,['taz']+trip_productions+trip_attractions]
df_external.set_index('taz', inplace=True)

###########################################################
###########################################################
### Enlisted Personnel
###########################################################
###########################################################
print ('Creating enlisted personnel data by taz')
# Open Group Quarters tables from the Input DB into dataframe
df_enlisted = pd.read_sql_query("SELECT * FROM enlisted_personnel", model_inputs_db)
df_enlisted['geoid10'] = df_enlisted['geoid10'].apply(str)

# Calculate the Inputs for the Year of the model
data_years = df_enlisted.columns[df_enlisted.columns.str.isnumeric()]
max_input_year = int(max(data_years))

if model_year <= max_input_year:
    
    df_enlisted['model-year'] = df_enlisted[str(model_year)]
    df_enlisted['model-year'] = df_enlisted['model-year'].apply(float)
        
elif model_year > max_input_year:
    df_enlisted['model-year'] = df_enlisted[str(max_input_year)]
    df_enlisted['model-year'] = df_enlisted['model-year'].apply(float)    
    df_enlisted['model-year'] = df_enlisted['model-year'] * (1+(enlisted_personnel_rate*(model_year-max_input_year)))

# Trim Down the Dataframe to only include 
keep_columns = ['geoid10','model-year']
df_enlisted = df_enlisted.loc[:,keep_columns]

# Merge With Block to TAZ lookup
enlisted_blocks = pd.merge(merged_blocks,df_enlisted,on='geoid10',suffixes=('_x','_y'),how='left')
enlisted_blocks.fillna(0,inplace=True)

# Read in rates and calculate Enlisted Personnel related trips by Purpose
df_enlisted_rates = pd.read_csv(enlisted_rates,header=0)
df_enlisted_rates.set_index('Trips', inplace=True)

for purpose in trip_attractions:
    enlisted_blocks[purpose] = enlisted_blocks['model-year'] * df_enlisted_rates[purpose].iloc[0]

# Consolidate Enlisted Personnel data to TAZ
working = enlisted_blocks.groupby('taz').sum()
working = working.reset_index()
enlisted_blocks_taz = pd.merge(all_taz,working,on='taz',suffixes=('_x','_y'),how='left')
enlisted_blocks_taz.fillna(0,inplace=True)
enlisted_blocks_taz = enlisted_blocks_taz.loc[:,['taz']+trip_attractions]
enlisted_blocks_taz.set_index('taz', inplace=True)

###########################################################
###########################################################
### Group Quarters
###########################################################
###########################################################
print ('Creating group quarter data by taz')
# Open Group Quarters tables from the Input DB into dataframes
total_gq_df = pd.read_sql_query("SELECT * FROM group_quarters", model_inputs_db)
total_gq_df['Dorm-Shares'] = total_gq_df['dorm_share'].apply(float)
total_gq_df['Military-Shares'] = total_gq_df['military_share'].apply(float)

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
keep_columns = ['geoid10','Dorms','Military','Other']
total_gq_df = total_gq_df.loc[:,keep_columns]
total_gq_df['geoid10'] = total_gq_df['geoid10'].apply(str)

# Merge With Block to TAZ lookup
gq_blocks = pd.merge(merged_blocks,total_gq_df,on='geoid10',suffixes=('_x','_y'),how='left')

# Read in rates and calculate Total Group Quarters related trips
df_gq_rates = pd.read_csv(gq_rates,header=0)
df_gq_rates.set_index('GQ-Category', inplace=True)

for purpose in trip_productions:
    gq_blocks[purpose] = gq_blocks['Dorms'] * df_gq_rates.loc['Dorms',purpose] + gq_blocks['Military'] * df_gq_rates.loc['Military',purpose] + gq_blocks['Other'] * df_gq_rates.loc['Other',purpose]

# Consolidate Group Quarters data to TAZ for output to travel model
working = gq_blocks.groupby('taz').sum()
working = working.reset_index()
df_gq_taz = pd.merge(all_taz,working,on='taz',suffixes=('_x','_y'),how='left')
df_gq_taz.fillna(0,inplace=True)
df_gq_taz = df_gq_taz.loc[:,['taz']+trip_productions]
df_gq_taz.set_index('taz', inplace=True)

###########################################################
###########################################################
### Heavy Trucks
###########################################################
###########################################################
print ('Creating heavy truck data by taz')
heavy_trucks = pd.read_sql_query("SELECT * FROM heavy_trucks", model_inputs_db)
heavy_trucks = heavy_trucks.drop('﻿record',axis=1)
heavy_trucks['atri_zone'] = heavy_trucks['atri_zone'].astype(int)

internal_trucks = heavy_trucks[heavy_trucks['atri_zone'] < 5000]
internal_trucks = internal_trucks.drop('taz',axis=1)
external_trucks = heavy_trucks[heavy_trucks['atri_zone'] >= 5000]

# Spatial Join ATRI Zones and TAZ Layers to create a atri/taz equivalency
keep_columns = ['atri_zone',taz_attribute]
atri_layer = create_point_from_polygon(atri_shapefile,state_plane)
atri_layer  = atri_layer.rename(columns={'TAZ':'atri_zone'})
merged_atri = gp_join(atri_layer,taz_shapefile,state_plane,keep_columns)
merged_atri['atri_zone'] = merged_atri['atri_zone'].astype(int)
merged_atri  = merged_atri.rename(columns={taz_attribute:'taz'})

working = pd.merge(internal_trucks,merged_atri,on='atri_zone',suffixes=('_x','_y'),how='left')
working.columns = working.columns.str.lower()

# Combine Internal and External ATRI Truck Trips
working = working.append(external_trucks,sort=True)
working = working.astype(float)

# Calculate the Inputs for the Year of the model
data_year = int(working['year'][1])
       
if model_year > data_year:   
    growth_rate = (1+(truck_rate*(model_year-data_year)))
    working['htkatt'] = working['htkatt'] * growth_rate
    working['htkpro'] = working['htkpro'] * growth_rate

working = working.drop('atri_zone',axis=1)
working = working.drop('year',axis=1)
working = working.groupby('taz').sum()
working = working.reset_index()

df_heavy_trucks = pd.merge(all_taz,working,on='taz',suffixes=('_x','_y'),how='left')
df_heavy_trucks.fillna(0,inplace=True)
df_heavy_trucks.set_index('taz', inplace=True)

###########################################################
###########################################################
### Joint Base Lewis McChord
###########################################################
###########################################################
print ('Creating jblm data by taz')
jblm_df = pd.read_sql_query("SELECT * FROM jblm_trips", model_inputs_db)
jblm_matrix = int(jblm_df['matrix_id'][0])
data_year = int(jblm_df['year'][0])

# Trim Out Trips to/from the I-5 external to create internal and external JBLM trips
jblm_ext_df = jblm_df[(jblm_df['o_type'] == "external" ) | (jblm_df['d_type'] == "external")]
jblm_int_df = jblm_df[(jblm_df['o_type'] == "internal" ) & (jblm_df['d_type'] == "internal")]

# Spatial Join Blocks to TAZ layer
keep_columns = ['origin_block','destination_block','trips',]
jblm_int_df = jblm_int_df.loc[:,keep_columns]

# First Get TAZ for Origin Zone for Internal JBLM Trips
jblm_int_blocks = jblm_int_df
jblm_int_blocks  = jblm_int_blocks.rename(columns={'origin_block':'geoid10'})
jblm_int_blocks['geoid10'] = jblm_int_blocks['geoid10'].astype(np.int64)
jblm_int_blocks['geoid10'] = jblm_int_blocks['geoid10'].astype(str)
jblm_int_blocks = pd.merge(jblm_int_blocks, merged_blocks,on='geoid10',suffixes=('_x','_y'),how='left')
jblm_int_blocks  = jblm_int_blocks.rename(columns={'taz':'origin_zone'})
jblm_int_blocks = jblm_int_blocks.drop('geoid10',axis=1)

# Next Get TAZ for Destination Zone for Internal JBLM Trips
jblm_int_blocks  = jblm_int_blocks.rename(columns={'destination_block':'geoid10'})
jblm_int_blocks['geoid10'] = jblm_int_blocks['geoid10'].astype(np.int64)
jblm_int_blocks['geoid10'] = jblm_int_blocks['geoid10'].astype(str)
jblm_int_blocks = pd.merge(jblm_int_blocks, merged_blocks,on='geoid10',suffixes=('_x','_y'),how='left')
jblm_int_blocks  = jblm_int_blocks.rename(columns={'taz':'destination_zone'})
jblm_int_blocks = jblm_int_blocks.drop('geoid10',axis=1)

# First Get TAZ for Origin Zone for External JBLM Trips
keep_columns = ['origin_block','destination_block','trips',]
jblm_ext_df = jblm_ext_df.loc[:,keep_columns]
jblm_ext_blocks = jblm_ext_df
jblm_ext_blocks.fillna(i5_station,inplace=True)
jblm_ext_blocks  = jblm_ext_blocks.rename(columns={'origin_block':'geoid10'})
jblm_ext_blocks['geoid10'] = jblm_ext_blocks['geoid10'].astype(np.int64)
jblm_ext_blocks['geoid10'] = jblm_ext_blocks['geoid10'].astype(str)
jblm_ext_blocks = pd.merge(jblm_ext_blocks, merged_blocks,on='geoid10',suffixes=('_x','_y'),how='left')
jblm_ext_blocks.fillna(i5_station,inplace=True)
jblm_ext_blocks  = jblm_ext_blocks.rename(columns={'taz':'origin_zone'})
jblm_ext_blocks = jblm_ext_blocks.drop('geoid10',axis=1)

# Next Get TAZ for Destination Zone for External JBLM Trips
jblm_ext_blocks  = jblm_ext_blocks.rename(columns={'destination_block':'geoid10'})
jblm_ext_blocks['geoid10'] = jblm_ext_blocks['geoid10'].astype(np.int64)
jblm_ext_blocks['geoid10'] = jblm_ext_blocks['geoid10'].astype(str)
jblm_ext_blocks = pd.merge(jblm_ext_blocks, merged_blocks,on='geoid10',suffixes=('_x','_y'),how='left')
jblm_ext_blocks.fillna(i5_station,inplace=True)
jblm_ext_blocks  = jblm_ext_blocks.rename(columns={'taz':'destination_zone'})
jblm_ext_blocks = jblm_ext_blocks.drop('geoid10',axis=1)

# Combine JBLM Trips
df_jblm = jblm_int_blocks.append(jblm_ext_blocks,sort=True)
df_jblm['trips'] = df_jblm['trips'].apply(float)
df_jblm = df_jblm.reset_index()

if model_year > data_year:   
    growth_rate = (1+(jblm_rate*(model_year-data_year)))
    df_jblm['trips'] = df_jblm['trips'] * growth_rate

df_jblm = df_jblm.astype(int)
    
# Create JBLM Input File for use in Emme
working_file = open(output_directory+'/jblm.in', "w")
working_file.write('c ' + str(model_year) + ' Trip Generation' + '\n')
working_file.write('c Trip Generation is based on '+ land_use_product + ' using the '+ taz_system + '\n')
working_file.write('c JBLM trips are based on gate counts, blue tooth and zipcode survey data' + '\n')
working_file.write('t matrices' + '\n')
working_file.write('a matrix=mf' + str(jblm_matrix) + ' jblm ' + '0 JBLM Trips' + '\n')
        
for rows in range(0, (len(df_jblm))):
            
    origin_zone = df_jblm['origin_zone'][rows]
    destination_zone = df_jblm['destination_zone'][rows]
    working_file.write(' '+str(origin_zone) + ' ' + str(destination_zone) + ' : ' + str(df_jblm['trips'][rows]) + '\n')

working_file.close()

###########################################################
###########################################################
### Remove JBLM Externals from the Externals dataframe 
###########################################################
###########################################################

# Calculate amount of JBLM traffic that is from/to an external and remove it from the External Station df
jblm_external = df_jblm[(df_jblm['origin_zone'] >=lowstation)]
jblm_ext_productions = sum(jblm_external['trips'])

jblm_external = df_jblm[(df_jblm['destination_zone'] >=lowstation)]
jblm_ext_attractions = sum(jblm_external['trips'])

# Calculate the total trip productions and attractions for the I-5 Zone
i5_ext_productions = 0
for purposes in trip_productions:
    i5_ext_productions = i5_ext_productions + df_external[purposes][i5_station]

i5_ext_attractions = 0
for purposes in trip_attractions:
    i5_ext_attractions = i5_ext_attractions + df_external[purposes][i5_station]

# Scale the I-5 station volumes by purpose
i5_revised_productions = i5_ext_productions - jblm_ext_productions
i5_revised_attractions = i5_ext_attractions - jblm_ext_attractions

revised_external_taz = df_external
for purposes in trip_productions:
    
    ratio = revised_external_taz[purposes][i5_station] / i5_ext_productions
    revised_external_taz[purposes][i5_station] = i5_revised_productions * ratio

for purposes in trip_attractions:
    
    ratio = revised_external_taz[purposes][i5_station] / i5_ext_attractions
    revised_external_taz[purposes][i5_station] = i5_revised_attractions * ratio

###########################################################
###########################################################
### SeaTac Airport 
###########################################################
###########################################################
print ('Reading in SeaTac aiport data')
df_seatac = pd.read_sql_query("SELECT * FROM seatac", model_inputs_db)
seatac_zone = int(seatac_id[983])
airport_matrix = int(df_seatac['matrix_id'][0])
seatac_enplanements = int(df_seatac[str(model_year)])

###########################################################
###########################################################
### Special Generators
###########################################################
###########################################################
print ('Creating special generator data by taz')
# Open Special Generator table from the Input DB into dataframe
df_special = pd.read_sql_query("SELECT * FROM special_generators", model_inputs_db)
df_special = df_special.drop('taz',axis=1)
working = pd.merge(merged_blocks,df_special,on='geoid10',suffixes=('_x','_y'),how='left')
working.fillna(0,inplace=True)

# Calculate the Inputs for the Year of the model
data_years = working.columns[working.columns.str.isnumeric()]
max_input_year = int(max(data_years))

if model_year <= max_input_year:
    
    working['Model-Year'] = working[str(model_year)]
    working['Model-Year'] = working['Model-Year'].apply(float)
        
elif model_year > max_input_year:
    working['Model-Year'] = working[str(max_input_year)]
    working['Model-Year'] = working['Model-Year'].apply(float)    
    working['Model-Year'] = working['Model-Year'] * (1+(special_generator_rate*(model_year-max_input_year)))

# Trim Down the Dataframe to only include 
keep_columns = ['geoid10','taz','Model-Year']
working = working.loc[:,keep_columns]

# Consolidate Special Generator data to TAZ
working = working.groupby('taz').sum()
working = working.reset_index()
working  =working.rename(columns={'Model-Year':'hboatt'})

special_blocks_taz = pd.merge(all_taz,working,on='taz',suffixes=('_x','_y'),how='left')
special_blocks_taz.fillna(0,inplace=True)
special_blocks_taz.set_index('taz', inplace=True)

###########################################################
###########################################################
### Create a Household file with cross classifications
### using the person and household file
###########################################################
###########################################################
print ('Creating HH cross-classification file')
person_df['people'] = 1

# Flag if the person has a full or part-time job
person_df['workers'] = 0
person_df.loc[person_df['pptyp'] == 1, 'workers'] = 1
person_df.loc[person_df['pptyp'] == 2, 'workers'] = 1 

# Flag if the person is a school age kid
person_df['school-age'] = 0
person_df.loc[person_df['pptyp'] == 6, 'school-age'] = 1
person_df.loc[person_df['pptyp'] == 7, 'school-age'] = 1   

# Flag if the person is a college student
person_df['college-student'] = 0
person_df.loc[person_df['pptyp'] == 5, 'college-student'] = 1
             
# Remove a couple columns
fields_to_remove=['pno','pptyp']
person_df = person_df.drop(fields_to_remove,axis=1)
             
# Create a HH file by grouping the person file by household number 
df_hh = person_df.groupby('hhno').sum()
df_hh = df_hh.reset_index()

# Merge the HH File created from the persons with the original HH file from H5
df_hh = pd.merge(df_hh,hh_df,on='hhno',suffixes=('_x','_y'),how='left')

# Create a Column for Household sizes 1, 2, 3 or 4+
df_hh['household-class'] = df_hh['hhsize']
df_hh.loc[df_hh['household-class'] > 4, 'household-class'] = 4
         
# Create a Column for workers 0, 1, 2 or 3+
df_hh['worker-class'] = df_hh['workers']
df_hh.loc[df_hh['worker-class'] > 3, 'worker-class'] = 3       

# Create a Column for Income 1, 2 ,3 or 4
df_hh['income-class'] = 0
df_hh.loc[df_hh['hhincome'] <= low_income, 'income-class'] = 1 
df_hh.loc[(df_hh['hhincome'] > low_income) & (df_hh['hhincome'] <= medium_income), 'income-class'] = 2 
df_hh.loc[(df_hh['hhincome'] > medium_income) & (df_hh['hhincome'] <= high_income), 'income-class'] = 3         
df_hh.loc[df_hh['hhincome'] > high_income, 'income-class'] = 4
         
# Create a Column for school age children 0, 1, 2 or 3+
df_hh['school-class'] = df_hh['school-age']
df_hh.loc[df_hh['school-class'] > 3, 'school-class'] = 3          

# Create a Column for college age persons 0, 1, 2+ 
df_hh['college-class'] = df_hh['college-student']
df_hh.loc[df_hh['college-class'] > 2, 'college-class'] = 2          
         
# Create a Columns for Household - Work - Income Cross-Classification, Income & School and Income and College
df_hh['hwi'] = 'h'+ df_hh['household-class'].apply(str) + 'w' + df_hh['worker-class'].apply(str) + 'i' + df_hh['income-class'].apply(str)
df_hh['si'] = 's'+ df_hh['school-class'].apply(str) + 'i' + df_hh['income-class'].apply(str)
df_hh['ci'] = 'c'+ df_hh['college-class'].apply(str) + 'i' + df_hh['income-class'].apply(str)

###########################################################
###########################################################
### Household trip production
###########################################################
###########################################################
print ('Calculating HH Trip Productions')
df_hh_rates = pd.read_csv(hh_rates,header=0)
df_sch_rates = pd.read_csv(sch_rates,header=0)
df_coll_rates = pd.read_csv(coll_rates,header=0)

# Merge Rates with Households by Cross-Classification so we end up with total household productions
df_hh = pd.merge(df_hh,df_hh_rates,on='hwi',suffixes=('_x','_y'),how='left')
df_hh = pd.merge(df_hh,df_sch_rates,on='si',suffixes=('_x','_y'),how='left')
df_hh = pd.merge(df_hh,df_coll_rates,on='ci',suffixes=('_x','_y'),how='left')
df_hh = df_hh.loc[:,trip_productions + trip_attractions + ['hhparcel','people']]
df_hh['total-hh'] = 1

###########################################################
###########################################################
### Combine HH Trip Generation with Parcels
###########################################################
###########################################################
print ('Place HH Trip Productions on parcels')
df_parcel_hh_pa = df_hh.groupby('hhparcel').sum()
df_parcel_hh_pa = df_parcel_hh_pa.reset_index()
df_parcel_hh_pa.rename(columns={'hhparcel': 'parcel-id','people': 'total-people'}, inplace=True)

###########################################################
###########################################################
### Parcel trip attractions
###########################################################
###########################################################
print ('Calculating Parcel Trip Attractions')
df_parcels = pd.merge(df_parcels, df_parcel_hh_pa, on='parcel-id', suffixes=('_x','_y'), how='left')
df_parcels.fillna(0,inplace=True)

# Create a couple columns for trip attractions for parcels
df_parcels['education'] = df_parcels['k-8'] + df_parcels['high-school']
df_parcels['mtkpro'] = 0
df_parcels['mtkatt'] = 0
df_parcels['cvhpro'] = 0
df_parcels['cvhatt'] = 0

# Trip Attractions based on employment categories
df_job_attraction_rates = pd.read_csv(employment_based_attraction_rates,header=0)
df_job_attraction_rates.set_index('employment-type', inplace=True)
attraction_purposes = trip_attractions + ['cvhatt','mtkatt']

for purpose in attraction_purposes:
    
    for jobs in employment_categories:
        df_parcels[purpose] = df_parcels[purpose] + (df_parcels[jobs] * df_job_attraction_rates.loc[jobs,purpose])

# Trip Productions based on employment categories
df_job_production_rates = pd.read_csv(employment_based_production_rates,header=0)
df_job_production_rates.set_index('employment-type', inplace=True)
productions_purposes = trip_productions + ['cvhpro','mtkpro']

for purpose in productions_purposes:
    
    for jobs in employment_categories:
        df_parcels[purpose] = df_parcels[purpose] + (df_parcels[jobs] * df_job_production_rates.loc[jobs,purpose])
         
###########################################################
###########################################################
### SeaTac Airport trip generation
###########################################################
###########################################################
print ('Calculate SeaTac Airport trips by parcels')
df_parcels['airport'] = (df_parcels['total-jobs']*air_jobs) + (df_parcels['total-people']*air_people)
aiport_balancing = seatac_enplanements / sum(df_parcels['airport'])
df_parcels['airport'] = df_parcels['airport']*aiport_balancing
df_parcels.to_csv(output_directory+'parcels.csv',index=True)
          
###########################################################
###########################################################
### Create TAZ Input files
###########################################################
###########################################################
print ('Creating Trip Productions and Attractions by TAZ')
working = df_parcels.groupby('taz').sum()
working = working.reset_index()
working.fillna(0,inplace=True)

# Add the County Name to the TAZ Dataframe. 
keep_columns = [taz_attribute,'COUNTY_NM']
taz_layer = create_point_from_polygon(taz_shapefile,state_plane)
merged_taz = gp_join(taz_layer,county_shapefile,state_plane,keep_columns)
merged_taz.rename(columns={'COUNTY_NM': 'County',taz_attribute: 'taz'}, inplace=True)
working = pd.merge(working,merged_taz,on='taz',suffixes=('_x','_y'),how='left')

# Create a Kitsap County flag
working['kitsap-flag']=0
working.loc[working['County'] == 'Kitsap', 'kitsap-flag'] = 1

# Create a JBLM Zone
working['jblm']=0
for ids in jblm_ids:
    working.loc[working['taz'] == jblm_ids[ids], 'jblm'] = 1

df_taz = pd.merge(all_taz,working,on='taz',suffixes=('_x','_y'),how='left')
df_taz.fillna(0,inplace=True)

# Create Index for TAX dataframe
df_taz.set_index('taz', inplace=True)

# Add in Heavy Truck Productions and Attractions
df_taz = pd.merge(df_taz, df_heavy_trucks, on='taz', suffixes=('_x','_y'), how='left')
df_taz.fillna(0,inplace=True)

# Clean up dataframe for further calculations as well as output
df_taz = df_taz.loc[:,trip_productions + ['cvhpro','mtkpro','htkpro'] + trip_attractions + ['cvhatt','mtkatt','htkatt','airport','kitsap-flag','jblm']]
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
all_purposes = trip_productions + trip_attractions
for purpose in all_purposes:
    df_taz[purpose] = df_taz[purpose] + revised_external_taz[purpose]
df_taz.to_csv(output_directory+'/5_add_externals.csv',index=True)

# Zero out JBLM trips that were generated above (so only inlcude Shopping, HBO, OtO and WtO)
jblm_purposes = ['hbw1pro','hbw2pro','hbw3pro','hbw4pro','colpro','schpro','cvhpro','mtkpro','htkpro',
                 'hbw1att','hbw2att','hbw3att','hbw4att','colatt','schatt','cvhatt','mtkatt','htkatt']

for purposes in jblm_purposes:
    df_taz.loc[df_taz['jblm'] == 1, purposes] = 0

# Adjust the taz level data based on trip rate adjustments
df_rate_adjustments = pd.read_csv(trip_rate_adjustments,header=0)
df_rate_adjustments.set_index('trip-purpose', inplace=True)
all_purposes = trip_productions + ['cvhpro','mtkpro','htkpro'] + trip_attractions + ['cvhatt','mtkatt','htkatt']

# Adjust Productions and Attractions by Adjustment Factors
for purpose in all_purposes:
    df_taz[purpose] = df_taz[purpose] * [df_rate_adjustments.loc[purpose,'regional']]
    df_taz[purpose] = df_taz[purpose] + (df_taz[purpose] * [df_rate_adjustments.loc[purpose,'kitsap']]*df_taz['kitsap-flag'])

df_taz.to_csv(output_directory+'/6_adjust_trip_ends.csv',index=True)

# Balance the taz dataframe
balanced_df = balance_trips(df_taz, balance_to_productions, 'pro')
balanced_df = balance_trips(df_taz, balance_to_attractions, 'att')
balanced_df.to_csv(output_directory+'/7_balance_trip_ends.csv',index=True)

###########################################################
###########################################################
### Create Emme Input Files
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
            
    current_zone = balanced_df['taz'][rows]
    working_file.write(' '+str(current_zone) + ' ' + str(seatac_zone) + ' : ' + str((balanced_df['airport'][rows])/2) + '\n')
    working_file.write(' '+str(seatac_zone) + ' ' + str(current_zone) + ' : ' + str((balanced_df['airport'][rows])/2) + '\n')         

working_file.close()

end_of_production = time.time()
print ('The Total Time for all processes took', (end_of_production-start_of_production)/60, 'minutes to execute.')
