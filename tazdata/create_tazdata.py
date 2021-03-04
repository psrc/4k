# This script calculate population, households and jobs and aggregate them for any zone system
# Spatial joins for block, taz and parcel inputs are all performed programatically using geopandas
# Created by Puget Sound Regional Council Staff
# March 2021

import h5py
import pandas as pd 
import os
from shapely.geometry import Point
import geopandas as gp
import sqlalchemy
from shapely import wkt
import pyodbc

model_base_year = 2018
model_year = 2050

zone_system_name = 'snohomish_maz2020'

psrc_zones = 'no'
overlay_zones = 'yes'

# Basic Inputs
model_outputs_folder = os.path.join('C:/model-outputs')
project_directory = os.path.join('X:/DSA/Data-Requests/snohomish-county')
spn = 'epsg:2285'

# Only need the followng if you are using a non-PSRC zone system
non_psrc_zone = os.path.join(project_directory, 'maz','SnoCo_SubMAZs2021.shp')
zone_id = 'SubMAZ2020'

geoelmer_connection = 'mssql+pyodbc://AWS-PROD-SQL\Sockeye/ElmerGeo?driver=SQL Server?Trusted_Connection=yes'
elmer_connection = "DRIVER={ODBC Driver 17 for SQL Server}; SERVER=AWS-PROD-SQL\Sockeye; DATABASE=Elmer; trusted_connection=yes"

orig_parcel = ['parcelid','empedu_p','empfoo_p', 'empgov_p', 'empind_p', 'empmed_p','empofc_p', 'empoth_p', 'empret_p', 'emprsc_p', 'empsvc_p', 'emptot_p', 'stuuni_p']
final_parcel = ['hhparcel', 'Education','Food Services', 'Government','Industrial','Medical Services', 'Office', 'Other Services', 'Retail', 'Resources', 'Services', 'Total Jobs', 'University Students','TAZ']

person_variables=['hhno']
hh_variables=['hhno','hhparcel','hhincome']

# Break points for classifications
# Income in 2014 $'s
low_income = 37000
medium_income = 74000
high_income = 111000

# Functions
def create_df_from_h5(h5_file, h5_table, h5_variables):

    h5_data = {}
    
    for var in h5_variables:
        h5_data[var] = h5_file[h5_table][var][:]
    
    return pd.DataFrame(h5_data)

def create_point_from_table(current_df,x_coord,y_coord,coord_sys):
    current_df['geometry'] = current_df.apply(lambda x: Point((float(x[x_coord]), float(x[y_coord]))), axis=1)
    geo_layer = gp.GeoDataFrame(current_df, geometry='geometry')
    geo_layer.crs = {'init' :coord_sys}
    
    return geo_layer

def read_from_sde(connection_string, feature_class_name, crs = {'init' :'epsg:2285'}):
    engine = sqlalchemy.create_engine(connection_string)
    con=engine.connect()
    feature_class_name = feature_class_name + '_evw'
    df=pd.read_sql('select *, Shape.STAsText() as geometry from %s' % (feature_class_name), con=con)
    con.close()
    df['geometry'] = df['geometry'].apply(wkt.loads)
    gdf=gp.GeoDataFrame(df, geometry='geometry')
    gdf.crs = crs
    cols = [col for col in gdf.columns if col not in ['Shape', 'GDB_GEOMATTR_DATA', 'SDE_STATE_ID']]
    return gdf[cols]

def create_point_from_polygon(polygon_shape,coord_sys):
    points = polygon_shape.copy()
    points.geometry = points['geometry'].centroid
    points.crs = {'init' :coord_sys}
    
    # create a geodataframe for points and return
    geo_layer = gp.GeoDataFrame(points, geometry='geometry')
    geo_layer.crs = {'init' :coord_sys}
    
    return geo_layer

##########################################################################################################################
##########################################################################################################################
### Spatial Layers
##########################################################################################################################
##########################################################################################################################

if psrc_zones == 'yes':
    print('Loading PSRC TAZ shapefile')
    zones = read_from_sde(geoelmer_connection, 'taz2010')
    cols = ['taz','geometry']
    zones = zones[cols]
    tazdata = pd.DataFrame(zones['taz'])
    tazdata  = tazdata.rename(columns={'taz':'TAZ'})

else:
    print('Loading other TAZ shapefile')
    zones = gp.GeoDataFrame.from_file(non_psrc_zone)
    cols = [zone_id,'geometry']
    zones = zones[cols]
    zones  = zones.rename(columns={zone_id:'taz'})
    tazdata = pd.DataFrame(zones['taz'])
    tazdata  = tazdata.rename(columns={'taz':'TAZ'})
    
print('Loading Block shapefile')
blocks = read_from_sde(geoelmer_connection, 'block2010')
cols = ['geoid10','geometry']
blocks = blocks[cols]

print('Spatial Join Blocks and TAZ')
keep_columns = ['geoid10','taz']
block_layer = create_point_from_polygon(blocks,spn)
block_taz = gp.sjoin(block_layer, zones, how = "inner", op='intersects')
block_taz = block_taz[keep_columns]

##########################################################################################################################
##########################################################################################################################
### Group Quarters
##########################################################################################################################
##########################################################################################################################
    
print('Reading OFM block level estimates for Group Quarters population from Elmer')
sql_conn = pyodbc.connect(elmer_connection)

print('Reading geography dimension table')
gq_dims = pd.read_sql(sql='select * from census.geography_dim', con=sql_conn)
cols = ['geography_dim_id','geography_type', 'block_geoid']
gq_dims = gq_dims[cols]
gq_dims = gq_dims[gq_dims['geography_type'] == 'Block']

print('Reading geography facts table')
gq_facts = pd.read_sql(sql='select * from ofm.estimate_facts', con=sql_conn)
cols = ['estimate_year', 'geography_dim_id', 'group_quarters_population', 'publication_dim_id']
gq_facts = gq_facts[cols]

if model_year > model_base_year:
    print('Data is for a forecast year, using latest GQ data from elmer to scale up')
    gq_facts = gq_facts[(gq_facts['estimate_year'] == model_base_year) & (gq_facts['publication_dim_id'] == 1)]
       
    macro_facts = pd.read_sql(sql='select * from Macroeconomic.pop_facts', con=sql_conn)
    cols = ['data_year', 'pop_group_dim_id', 'population']
    macro_facts = macro_facts[cols]
    macro_facts = macro_facts[(macro_facts['data_year'] == model_year) & (macro_facts['pop_group_dim_id'] == 5)]
    
    gq_ratio = sum(macro_facts['population']) / sum(gq_facts['group_quarters_population'])
    gq_facts['group_quarters_population'] = gq_facts['group_quarters_population'] * gq_ratio

else:
    print('Grabbing GQ data for ' + str(model_year))
    gq_facts = gq_facts[(gq_facts['estimate_year'] == model_year) & (gq_facts['publication_dim_id'] == 1)]

print('Joining facts and dimensions for GQ population by census block')
gq = pd.merge(gq_dims, gq_facts, on='geography_dim_id',suffixes=('_x','_y'),how='left')
cols = ['block_geoid','group_quarters_population']
gq = gq[cols]

print('Breaking out GQ shares to dorms, military and other using gq shares from 2010 census')
gq_shares = pd.read_csv(os.path.join(model_outputs_folder,'gq_shares.csv'))
gq_shares['geoid10'] = gq_shares['geoid10'].astype(str)
gq = pd.merge(gq, gq_shares, left_on = 'block_geoid', right_on = 'geoid10', suffixes=('_x','_y'), how='left')
gq.fillna(0,inplace=True)
gq['GQDORM'] = gq['group_quarters_population'] * gq['dorm_share']
gq['GQMILH'] = gq['group_quarters_population'] * gq['military_share']
gq['GQOTH'] = gq['group_quarters_population'] * gq['other_share']

print('Adding TAZ number to Block file based on spatial joining of block centroids')
gq = pd.merge(block_taz, gq, left_on = 'geoid10', right_on = 'block_geoid', suffixes=('_x','_y'), how='left')
cols = ['taz', 'group_quarters_population', 'GQDORM', 'GQMILH','GQOTH']
fcols = ['TAZ','Group Quarters', 'GQDORM', 'GQMILH','GQOTH']
gq = gq[cols]
gq.columns = fcols
gq_taz = gq.groupby('TAZ').sum().reset_index()

##########################################################################################################################
##########################################################################################################################
### People, Households and Jobs
##########################################################################################################################
##########################################################################################################################

if overlay_zones == 'yes':
       
    print ('Creating a parcel layer from the x,y')
    working = pd.read_csv(os.path.join(model_outputs_folder,str(model_year),'parcels_urbansim.txt'), sep = ' ')
    working.columns = working.columns.str.lower()
    parcels_layer = create_point_from_table(working,'xcoord_p','ycoord_p',spn)
    
    print('Adding TAZ number to parcel file based on spatial joining of parcel centroids')
    parcels = gp.sjoin(parcels_layer, zones, how = "inner", op='intersects')
    orig_parcel.append('taz')
    parcels = parcels[orig_parcel]
    parcels.columns = final_parcel
        
else:
    print('Loading parcels file for PSRC TAZs and cleaning up names')
    parcels = pd.read_csv(os.path.join(model_outputs_folder,str(model_year),'parcels_urbansim.txt'), sep = ' ')
    parcels.columns = parcels.columns.str.lower()
    orig_parcel.append('taz_p')
    parcels = parcels[orig_parcel]
    parcels.columns = final_parcel

print('Load household and person h5 file')
hh_people = h5py.File(os.path.join(model_outputs_folder, str(model_year), 'hh_and_persons.h5'),'r+') 
    
print('Total populaton by household')
person_df = create_df_from_h5(hh_people, 'Person', person_variables)
person_df['Population'] = 1
hh_pop = person_df.groupby('hhno').sum().reset_index()    
    
print('Households by income level')
households = create_df_from_h5(hh_people, 'Household', hh_variables)
households = pd.merge(households, hh_pop, on='hhno',suffixes=('_x','_y'),how='left')

print('Adding households by income columns to household file') 
households['HH1'] = 0
households['HH2'] = 0
households['HH3'] = 0
households['HH4'] = 0
households.loc[households['hhincome'] <= low_income, 'HH1'] = 1 
households.loc[(households['hhincome'] > low_income) & (households['hhincome'] <= medium_income), 'HH2'] = 1 
households.loc[(households['hhincome'] > medium_income) & (households['hhincome'] <= high_income), 'HH3'] = 1         
households.loc[households['hhincome'] > high_income, 'HH4'] = 1
cols = ['hhparcel','Population','HH1','HH2','HH3','HH4']
households = households[cols]

print('Joining Population and Households by Income to parcels files')
hh_parcel = households.groupby('hhparcel').sum().reset_index()
parcels = pd.merge(parcels, hh_parcel, on='hhparcel',suffixes=('_x','_y'),how='left')
parcels.fillna(0,inplace=True)

##########################################################################################################################
##########################################################################################################################
### Creating TAZ level outputs
##########################################################################################################################
##########################################################################################################################

print('Creating TAZ Level Data')
working = parcels.groupby('TAZ').sum().reset_index()
fcols = ['TAZ','HH1','HH2', 'HH3', 'HH4', 'Population', 'Retail', 'Office', 'Services', 'Food Services','Medical Services', 'Other Services', 'Government', 'Education', 'Industrial', 'Resources', 'Total Jobs', 'University Students'] 
working = working[fcols]
tazdata = pd.merge(tazdata, working, on = 'TAZ', suffixes=('_x','_y'), how='left' )
tazdata = pd.merge(tazdata, gq_taz, on = 'TAZ', suffixes=('_x','_y'), how='left' )
tazdata.fillna(0,inplace=True)
tazdata['Population'] = tazdata['Population'] + tazdata['Group Quarters']
tazdata = tazdata.sort_values(by=['TAZ'])
tazdata.to_csv(os.path.join(project_directory,'tazdata_' + zone_system_name + '_' + str(model_year) +'.csv'), index=False)
             