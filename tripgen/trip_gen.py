# This script completes trip generation using a parcel input for PSRC's 3700 zone system
# Created by Puget Sound Regional Council Staff
# June 2018

import h5py
import pandas as pd
import time
from trip_gen_inputs import *
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
        working_df[purposes[0]] = working_df[purposes[0]] + (working_df[purposes[0]] * purposes[1] * working_df['kitsap'])
    
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
            
            current_zone = int(working_df['taz'][rows])
            
            if matrix_type == 'mo':
                working_file.write(' '+str(current_zone) + ' all: ' + str(working_df[purposes[0]][rows]) + '\n')
            
            elif matrix_type == 'md':
                working_file.write(' all '+str(current_zone) + ': ' + str(working_df[purposes[0]][rows]) + '\n')
            
        working_file.close()
        matrix_start += 1

start_of_production = time.time()

###########################################################
###########################################################
### Connect to the Trip Generation Database of input files
###########################################################
###########################################################
model_inputs_db = sqlite3.connect(model_files)

###########################################################
###########################################################
### PSRC Zone System for TAZ joing
###########################################################
###########################################################
print 'Creating psrc zone system dataframe'
df_psrc = pd.read_sql_query("SELECT * FROM psrc_zones", model_inputs_db)
df_psrc['taz'] = df_psrc['taz'].astype(int)
df_psrc = df_psrc.loc[:,['taz','county','jblm','external']]

###########################################################
###########################################################
### Auto External Stations
###########################################################
###########################################################
print 'Creating auto external data by taz'
df_external = pd.read_sql_query("SELECT * FROM auto_externals", model_inputs_db)
df_external['taz'] = df_external['taz'].astype(int)
df_external = df_external.loc[:,['taz','year'] + trip_productions + trip_attractions]
data_year = int(df_external['year'][0])

# Join to full TAZ file to ensure final merging works
df_external = pd.merge(df_psrc, df_external, on='taz', suffixes=('_x','_y'), how='left')
df_external.fillna(0,inplace=True)
df_external.set_index('taz', inplace=True)
df_external = df_external.loc[:,['year'] + trip_productions + trip_attractions]
df_external = df_external.astype(float)

# Calculate the Inputs for the Year of the model      
if model_year > data_year:   
    growth_rate = (1+(external_rate*(model_year-data_year)))
    df_external = df_external * growth_rate

external_taz = df_external.loc[:,trip_productions + trip_attractions]

###########################################################
###########################################################
### Enlisted Personnel
###########################################################
###########################################################
print 'Creating enlisted personnel data by taz'
df_enlisted = pd.read_sql_query("SELECT * FROM enlisted_personnel", model_inputs_db)

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
keep_columns = ['taz','model-year']
df_enlisted = df_enlisted.loc[:,keep_columns]

# Read in rates and calculate Enlisted Personnel related trips by Purpose
df_enlisted_rates = pd.read_csv(enlisted_rates,header=0)
df_enlisted_rates.set_index('Trips', inplace=True)

for purpose in trip_attractions:
    df_enlisted[purpose] = df_enlisted['model-year'] * df_enlisted_rates[purpose]['Enlisted']

# Consolidate Enlisted Personnel data to TAZ
enlisted_taz = df_enlisted.groupby('taz').sum()
enlisted_taz = enlisted_taz.reset_index()
enlisted_taz['taz'] = enlisted_taz['taz'].apply(int)

# Join to full TAZ file to ensure final merging works
enlisted_taz = pd.merge(df_psrc, enlisted_taz, on='taz', suffixes=('_x','_y'), how='left')
enlisted_taz.fillna(0,inplace=True)
enlisted_taz.set_index('taz', inplace=True)
enlisted_taz = enlisted_taz.loc[:,trip_attractions]

###########################################################
###########################################################
### Group Quarters
###########################################################
###########################################################
print 'Creating group quarter data by taz'
total_gq_df = pd.read_sql_query("SELECT * FROM group_quarters", model_inputs_db)
total_gq_df['dorm_share'] = total_gq_df['dorm_share'].apply(float)
total_gq_df['military_share'] = total_gq_df['military_share'].apply(float)
total_gq_df['other_share'] = total_gq_df['other_share'].apply(float)

# Calculate the Inputs for the Year of the model
data_years = total_gq_df.columns[total_gq_df.columns.str.isnumeric()]
max_input_year = int(max(data_years))

if model_year <= max_input_year:
    
    total_gq_df['group-quarters'] = total_gq_df[str(model_year)]
    total_gq_df['group-quarters'] = total_gq_df['group-quarters'].apply(float)
        
elif model_year > max_input_year:
    total_gq_df['group-quarters'] = total_gq_df[str(max_input_year)]
    total_gq_df['group-quarters'] = total_gq_df['group-quarters'].apply(float)    
    total_gq_df['group-quarters'] = total_gq_df['group-quarters'] * (1+(group_quarters_rate*(model_year-max_input_year)))

keep_columns = ['taz', 'dorm_share', 'military_share', 'other_share', 'group-quarters']
total_gq_df = total_gq_df.loc[:,keep_columns]

total_gq_df['dorms'] = total_gq_df['group-quarters'] * total_gq_df['dorm_share']
total_gq_df['military'] = total_gq_df['group-quarters'] * total_gq_df['military_share']
total_gq_df['other'] = total_gq_df['group-quarters'] * total_gq_df['other_share']
   
# Merge with the Block/Taz dataframe and trim down the columns
keep_columns = ['taz','dorms','military','other']
total_gq_df = total_gq_df.loc[:,keep_columns]

# Read in rates and calculate total Group Quarters related trips
df_gq_rates = pd.read_csv(gq_rates,header=0)
df_gq_rates.set_index('GQ-Category', inplace=True)

for purpose in trip_productions:
    total_gq_df[purpose] = total_gq_df['dorms'] * df_gq_rates.loc['Dorms',purpose] + total_gq_df['military'] * df_gq_rates.loc['Military',purpose] + total_gq_df['other'] * df_gq_rates.loc['Other',purpose]

# Consolidate Group Quarters data to TAZ for output to travel model
group_quarters_taz = total_gq_df.groupby('taz').sum()
group_quarters_taz = group_quarters_taz.reset_index()
group_quarters_taz['taz'] = group_quarters_taz['taz'].apply(int)

# Join to full TAZ file to ensure final merging works
group_quarters_taz = pd.merge(df_psrc, group_quarters_taz, on='taz', suffixes=('_x','_y'), how='left')
group_quarters_taz.fillna(0,inplace=True)
group_quarters_taz.set_index('taz', inplace=True)
group_quarters_taz = group_quarters_taz.loc[:,trip_productions]

###########################################################
###########################################################
### Heavy Trucks
###########################################################
###########################################################
print 'Creating heavy truck data by taz'
heavy_trucks = pd.read_sql_query("SELECT * FROM heavy_trucks", model_inputs_db)
keep_columns = ['taz','year','htkpro','htkatt']
heavy_trucks = heavy_trucks.loc[:,keep_columns]

# Calculate the Inputs for the Year of the model
data_year = int(heavy_trucks['year'][1])
heavy_trucks = heavy_trucks.drop('year',axis=1)
heavy_trucks['htkpro'] = heavy_trucks['htkpro'].apply(float)
heavy_trucks['htkatt'] = heavy_trucks['htkatt'].apply(float)
       
if model_year > data_year:   
    growth_rate = (1+(truck_rate*(model_year-data_year)))
    heavy_trucks['htkpro'] = heavy_trucks['htkpro'] * growth_rate
    heavy_trucks['htkatt'] = heavy_trucks['htkatt'] * growth_rate

# Make the TAZ field the index
heavy_trucks_taz = heavy_trucks.groupby('taz').sum()
heavy_trucks_taz = heavy_trucks_taz.reset_index()
heavy_trucks_taz['taz'] = heavy_trucks_taz['taz'].apply(int)

# Join to full TAZ file to ensure final merging works
heavy_trucks_taz = pd.merge(df_psrc, heavy_trucks_taz, on='taz', suffixes=('_x','_y'), how='left')
heavy_trucks_taz.fillna(0,inplace=True)
heavy_trucks_taz = heavy_trucks_taz.loc[:,['taz','htkpro','htkatt']]
 
###########################################################
###########################################################
### Joint Base Lewis McChord
###########################################################
###########################################################
print 'Creating jblm data by taz'
jblm_df = pd.read_sql_query("SELECT * FROM jblm_trips", model_inputs_db)
jblm_matrix = int(jblm_df['matrix_id'][0])
data_year = int(jblm_df['year'][0])

keep_columns = ['origin_zone','destination_zone','trips',]
jblm_df = jblm_df.loc[:,keep_columns]
jblm_df['trips'] = jblm_df['trips'].apply(float)
       
if model_year > data_year:   
    growth_rate = (1+(jblm_rate*(model_year-data_year)))
    jblm_df['trips'] = jblm_df['trips'] * growth_rate
    
# Create JBLM Input File for use in Emme
working_file = open(output_directory+'/jblm.in', "w")
working_file.write('c ' + str(model_year) + ' Trip Generation' + '\n')
working_file.write('c Trip Generation is based on '+ land_use_product + ' using the '+ taz_system + '\n')
working_file.write('c JBLM trips are based on gate counts, blue tooth and zipcode survey data' + '\n')
working_file.write('t matrices' + '\n')
working_file.write('a matrix=mf' + str(jblm_matrix) + ' jblm ' + '0 JBLM Trips' + '\n')
        
for rows in range(0, (len(jblm_df))):
            
    origin_zone = jblm_df['origin_zone'][rows]
    destination_zone = jblm_df['destination_zone'][rows]
    working_file.write(' '+str(origin_zone) + ' ' + str(destination_zone) + ' : ' + str(jblm_df['trips'][rows]) + '\n')

working_file.close()

###########################################################
###########################################################
### SeaTac Airport 
###########################################################
###########################################################
print 'Reading in SeaTac aiport data'
df_seatac = pd.read_sql_query("SELECT * FROM seatac", model_inputs_db)
seatac_zone = int(df_seatac['taz'][0])
airport_matrix = int(df_seatac['matrix_id'][0])
seatac_enplanements = int(df_seatac[str(model_year)])

###########################################################
###########################################################
### Special Generators
###########################################################
###########################################################
print 'Creating special generator data by taz'
df_special = pd.read_sql_query("SELECT * FROM special_generators", model_inputs_db)

# Calculate the Inputs for the Year of the model
data_years = df_special.columns[df_special.columns.str.isnumeric()]
max_input_year = int(max(data_years))

if model_year <= max_input_year:
    
    df_special['hboatt'] = df_special[str(model_year)]
    df_special['hboatt'] = df_special['hboatt'].apply(float)
        
elif model_year > max_input_year:
    df_special['hboatt'] = df_special[str(max_input_year)]
    df_special['hboatt'] = df_special['hboatt'].apply(float)    
    df_special['hboatt'] = df_special['hboatt'] * (1+(special_generator_rate*(model_year-max_input_year)))

# Trim Down the Dataframe to only include 
keep_columns = ['taz','hboatt']
df_special = df_special.loc[:,keep_columns]

# Consolidate Special Generator data to TAZ
special_generators_taz = df_special.groupby('taz').sum()
special_generators_taz = special_generators_taz.reset_index()
special_generators_taz['taz'] = special_generators_taz['taz'].apply(int)

# Join to full TAZ file to ensure final merging works
special_generators_taz = pd.merge(df_psrc, special_generators_taz, on='taz', suffixes=('_x','_y'), how='left')
special_generators_taz.fillna(0,inplace=True)
special_generators_taz.set_index('taz', inplace=True)
special_generators_taz = special_generators_taz.loc[:,['hboatt']]

###########################################################
###########################################################
### Load Household, Person and Parcel files 
###########################################################
###########################################################
print 'Loading HH and Parcel file'
hh_people = h5py.File(hh_person,'r+') 
hh_df = create_df_from_h5(hh_people, 'Household', hh_variables)
person_df = create_df_from_h5(hh_people, 'Person', person_variables)

parcels = pd.read_csv(parcel_file, sep = ' ')
parcels.columns = parcels.columns.str.lower()
parcels = parcels.loc[:,original_parcel_columns]
parcels.columns = updated_parcel_columns

###########################################################
###########################################################
### Create a Household file with cross classifications
### using the person and household file
###########################################################
###########################################################
print 'Creating HH cross-classification file'
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
print 'Calculating HH Trip Productions'
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
print 'Place HH Trip Productions on parcels'
df_parcel_hh_pa = df_hh.groupby('hhparcel').sum()
df_parcel_hh_pa = df_parcel_hh_pa.reset_index()
df_parcel_hh_pa.rename(columns={'hhparcel': 'parcel-id','people': 'population'}, inplace=True)

###########################################################
###########################################################
### Parcel trip attractions
###########################################################
###########################################################
print 'Calculating Parcel Trip Attractions'
df_parcels = pd.merge(parcels, df_parcel_hh_pa, on='parcel-id', suffixes=('_x','_y'), how='left')
df_parcels.fillna(0,inplace=True)

# Create a couple columns for trip attractions for parcels
df_parcels['education'] = df_parcels['k-8'] + df_parcels['high-school']
df_parcels['mtkpro'] = 0
df_parcels['mtkatt'] = 0
df_parcels['cvhpro'] = 0
df_parcels['cvhatt'] = 0

for purpose in trip_attraction_rates:
                 
    for jobs in purpose[1]:
        df_parcels[purpose[0]] = df_parcels[purpose[0]] + (df_parcels[jobs[0]] * jobs[1])
         
###########################################################
###########################################################
### SeaTac Airport trip generation
###########################################################
###########################################################
print 'Calculate SeaTac Airport trips by parcels'
df_parcels['airport'] = (df_parcels['total-jobs']*air_jobs) + (df_parcels['population']*air_people)
aiport_balancing = seatac_enplanements / sum(df_parcels['airport'])
df_parcels['airport'] = df_parcels['airport']*aiport_balancing
          
###########################################################
###########################################################
### Create TAZ Input files
###########################################################
###########################################################
print 'Creating Trip Productions and Attractions by TAZ'
df_taz = df_parcels.groupby('taz').sum()
df_taz = df_taz.reset_index()
df_taz.fillna(0,inplace=True)
df_taz['taz'] = df_taz['taz'].apply(int)

# Join to full TAZ file to ensure final merging works
df_taz = pd.merge(df_psrc, df_taz, on='taz', suffixes=('_x','_y'), how='left')
df_taz.fillna(0,inplace=True)

# Create a Kitsap County flag for use in Kitsap Adjustments
df_taz['kitsap']=0
df_taz.loc[df_taz['county'] == 'Kitsap', 'kitsap'] = 1

# Add in Heavy Truck Productions and Attractions
df_taz = pd.merge(df_taz, heavy_trucks_taz, on='taz', suffixes=('_x','_y'), how='left')
df_taz.fillna(0,inplace=True)

# Clean up dataframe for further calculations as well as output
df_taz.set_index('taz', inplace=True)
df_taz = df_taz.loc[:,trip_productions + ['cvhpro','mtkpro','htkpro'] + trip_attractions + ['cvhatt','mtkatt','htkatt','airport','kitsap','jblm']]
df_taz.to_csv(output_directory+'/1_unadjusted_unbalanced.csv',index=True)

# Add in the Group Quarters to Trip Productions   
for purpose in trip_productions:
    df_taz[purpose] = df_taz[purpose] + group_quarters_taz[purpose]
df_taz.to_csv(output_directory+'/2_add_group_quarters.csv',index=True)

# Add in the Enlisted Personnel to Trip Attractions
for purpose in trip_attractions:
    df_taz[purpose] = df_taz[purpose] + enlisted_taz[purpose]
df_taz.to_csv(output_directory+'/3_add_enlisted_personnel.csv',index=True)

# Add in the Special Generators to Trip Attractions
df_taz['hboatt'] = df_taz['hboatt'] + special_generators_taz['hboatt']
df_taz.to_csv(output_directory+'/4_add_special_generators.csv',index=True)

# Add in the External Trips
all_purposes = trip_productions + trip_attractions
for purpose in all_purposes:
    df_taz[purpose] = df_taz[purpose] + external_taz[purpose]
df_taz.to_csv(output_directory+'/5_add_externals.csv',index=True)

# Zero out JBLM trips that were generated above (so only inlcude Shopping, HBO, OtO and WtO)
df_taz['jblm'] = df_taz['jblm'].apply(int)
jblm_purposes = ['hbw1pro','hbw2pro','hbw3pro','hbw4pro','colpro','schpro','cvhpro','mtkpro','htkpro',
                 'hbw1att','hbw2att','hbw3att','hbw4att','colatt','schatt','cvhatt','mtkatt','htkatt']

for purposes in jblm_purposes:
    df_taz.loc[df_taz['jblm'] == 1, purposes] = 0

# Adjust the taz level data based on trip rate adjustments
adjusted_df = adjust_trips(df_taz, regional_attraction_adjustments, kitsap_attraction_adjustments)
adjusted_df = adjust_trips(df_taz, regional_production_adjustments, kitsap_production_adjustments)
adjusted_df.to_csv(output_directory+'/6_adjust_trip_ends.csv',index=True)

# Balance the taz dataframe
balanced_df = balance_trips(adjusted_df, balance_to_productions, 'pro')
balanced_df = balance_trips(adjusted_df, balance_to_attractions, 'att')
balanced_df.to_csv(output_directory+'/7_balance_trip_ends.csv',index=True)

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
            
    current_zone = balanced_df['taz'][rows]
    working_file.write(' '+str(current_zone) + ' ' + str(seatac_zone) + ' : ' + str((balanced_df['airport'][rows])/2) + '\n')
    working_file.write(' '+str(seatac_zone) + ' ' + str(current_zone) + ' : ' + str((balanced_df['airport'][rows])/2) + '\n')         

working_file.close()

end_of_production = time.time()
print 'The Total Time for all processes took', (end_of_production-start_of_production)/60, 'minutes to execute.'
exit()
             