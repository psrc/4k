# Inputs for the Trip Generation by Parcel and Households
# Created by Puget Sound Regional Council Staff
# November 2017

# Input Files
model_directory = '//file2/Model/e2projects_two/4K/Testing/TripGen'
model_year = 2014
taz_system = 'PSRC 3700 Zone System'
land_use_product = 'Land Use Vision 2.0'

# Person, Household, Parcel and Block Level input files
hh_person = model_directory+'/inputs/hh_and_persons.h5'
parcel_file = model_directory+'/inputs/parcels_urbansim.txt'
model_files = model_directory+'/inputs/travel_model_inputs.db'
heavy_truck_internal_file = model_directory+'/inputs/atri__heavy_trucks_internals.csv'
heavy_truck_external_file = model_directory+'/inputs/atri__heavy_trucks_externals.csv'

# Growth Rates to use for adjsuting input files for specific forecast years
special_generator_rate = 0.0096
group_quarters_rate = 0.0034
enlisted_personnel_rate = 0.0000
external_rate = 0.0135
truck_rate = 0.0135

# Trip Rates
hh_rates = model_directory+'/rates/hh_rates.csv'
sch_rates = model_directory+'/rates/school_rates.csv'
coll_rates = model_directory+'/rates/college_rates.csv'
gq_rates = model_directory+'/rates/gq_rates.csv'
enlisted_rates = model_directory+'/rates/enlisted_rates.csv'

# GIS layers for spatial joins
taz_shapefile = '//file2/Gisapps/geodata/forecast/taz2010.shp'
block_shapefile = '//file2/Gisapps/geodata/census//Block/block2010.shp'
county_shapefile = '//file2/Gisapps/geodata/political/regcnty.shp'
atri_shapefile = '//file2/Model/e2projects_two/4K/Testing/TripGen/inputs/gis/zones.shp'
state_plane = 'epsg:2285'

# Break points for classifications
# Income in 2014 $'s
low_income = 37000
medium_income = 74000
high_income = 111000

# Aiport Trip Rates
air_people = 0.02112
air_jobs = 0.01486
seatac_enplanements = 105240
seatac_zone = 983
airport_matrix = 25

# Dictionaries, Lists

# Parcel Columns to use and what to rename them
original_parcel_columns = ['PARCELID','XCOORD_P','YCOORD_P','EMPEDU_P','EMPFOO_P','EMPGOV_P','EMPIND_P','EMPMED_P','EMPOFC_P','EMPRET_P','EMPRSC_P','EMPSVC_P','EMPOTH_P','EMPTOT_P','STUGRD_P','STUHGH_P','STUUNI_P']
updated_parcel_columns = ['Parcel-ID','XCoord','YCoord','Education','Food-Services','Government','Industrial','Medical','Office','Retail','Resources','Services','Other','Total-Jobs','K-8','High-School','University']

# Lists for Group Quarters
trip_productions = ['hbw1pro','hbw2pro','hbw3pro','hbw4pro','colpro','hsppro','hbopro','schpro','otopro','wtopro']
trip_attractions = ['hbw1att','hbw2att','hbw3att','hbw4att','colatt','hspatt','hboatt','schatt','otoatt','wtoatt']

# Lists for HH and Person Files
hh_variables=['hhno','hhsize','hhparcel','hhincome']
person_variables=['pno','hhno','pptyp']

# Dictionaries of Trip Attraction Rates 
hbw1_att = [('Retail', 0.2140),
            ('Food-Services', 0.2140),
            ('Government', 0.1900),
            ('Office', 0.1870),
            ('Services', 0.1870),
            ('Industrial', 0.0580),
            ('Education', 0.1940),
            ('Medical', 0.1870),
            ('Other', 0.1870)]

hbw2_att = [('Retail', 0.2982),
            ('Food-Services', 0.2980),
            ('Government', 0.1770),
            ('Office', 0.2430),
            ('Services', 0.2430),
            ('Industrial', 0.1170),
            ('Education', 0.2650),
            ('Medical', 0.2430),
            ('Other', 0.2430)]

hbw3_att = [('Retail', 0.4460),
            ('Food-Services', 0.4460),
            ('Government', 0.2450),
            ('Office', 0.3460),
            ('Services', 0.3460),
            ('Industrial', 0.2280),
            ('Education', 0.4480),
            ('Medical', 0.3460),
            ('Other', 0.3460)]

hbw4_att = [('Retail', 0.5020),
            ('Food-Services', 0.5020),
            ('Government', 0.3060),
            ('Office', 0.4860),
            ('Services', 0.4860),
            ('Industrial', 0.3060),
            ('Education', 0.6010),
            ('Medical', 0.4860),
            ('Other',  0.4860)]

college_att = [('University', 0.8800)]

shopping_att = [('Retail', 3.6400),
            ('Food-Services', 3.6400)]

school_att = [('Education', 2.0000)]

hbo_att = [('Retail', 3.7620),
            ('Food-Services', 3.7620),
            ('Government', 0.0000),
            ('Office', 0.0320),
            ('Services', 0.0320),
            ('Medical', 0.0320),
            ('Other', 0.0320)]

oto_att = [('Retail', 3.5500),
            ('Food-Services', 3.5500),
            ('Government', 0.0000),
            ('Office', 0.0000),
            ('Services', 0.0000),
            ('Medical', 0.0000),
            ('Other', 0.0000)]

wto_att = [('Retail', 1.6490),
            ('Food-Services', 1.6490),
            ('Government', 0.2820),
            ('Office', 0.7930),
            ('Services', 0.7930),
            ('Medical', 0.7930),
            ('Other', 0.7930)]

medium_truck_att = [('Retail', 0.02),
            ('Food-Services', 0.02),
            ('Government', 0.02),
            ('Office', 0.04),
            ('Services', 0.04),
            ('Industrial', 0.15),
            ('Education', 0.02),
            ('Medical', 0.02),
            ('Other', 0.04),
            ('Total-HHs',0.04)]


medium_truck_pro = [('Retail', 0.15),
            ('Food-Services', 0.15),
            ('Government', 0.04),
            ('Office', 0.04),
            ('Services', 0.04),
            ('Industrial', 0.25),
            ('Education', 0.04),
            ('Medical', 0.04),
            ('Other', 0.04),
            ('Total-HHs',0.04)]

trip_attraction_rates = [('hbw1att',hbw1_att),
                         ('hbw2att',hbw2_att),
                         ('hbw3att',hbw3_att),
                         ('hbw4att', hbw4_att),
                         ('colatt',college_att),
                         ('hspatt',shopping_att),
                         ('schatt', school_att),
                         ('hboatt', hbo_att),
                         ('otoatt', oto_att),
                         ('wtoatt', wto_att),
                         ('mtkatt',medium_truck_att),
                         ('mtkpro',medium_truck_pro)]

productions_4k = [('hbw1pro','work income #1 productions'),
                   ('hbw2pro','work income #2 productions'),
                   ('hbw3pro','work income #3 productions'),
                   ('hbw4pro','work income #4 productions'),
                   ('colpro','college productions'),
                   ('hsppro','shopping productions'),
                   ('schpro','school productions'),
                   ('hbopro','home based other productions'),
                   ('otopro','other to other productions'),
                   ('wtopro','work to other productions'),
                   ('mtkpro','medium truck productions'),
                   ('htkpro','heavy truck productions')]

attractions_4k = [('hbw1att','work income #1 attractions'),
                   ('hbw2att','work income #2 attractions'),
                   ('hbw3att','work income #3 attractions'),
                   ('hbw4att','work income #4 attractions'),
                   ('colatt','college attractions'),
                   ('hspatt','shopping attractions'),
                   ('schatt','school attractions'),
                   ('hboatt','home based other attractions'),
                   ('otoatt','other to other attractions'),
                   ('wtoatt','work to other attractions'),
                   ('mtkatt','medium truck attractions'),
                   ('htkatt','heavy truck attractions')]

airport_4k = [('airport','SeaTac Airport Trips')]

balance_to_productions = ['hbw1','hbw2','hbw3','hbw4','hsp','hbo','oto','wto','mtk','htk']
balance_to_attractions = ['col','sch']

regional_attraction_adjustments = [('hbw1att',1.0),
                         ('hbw2att',1.0),
                         ('hbw3att',1.0),
                         ('hbw4att', 1.0),
                         ('colatt',1.0),
                         ('hspatt',1.0),
                         ('schatt', 1.0),
                         ('hboatt', 1.0),
                         ('otoatt', 1.0),
                         ('wtoatt', 1.0),
                         ('mtkatt', 0.75),
                         ('htkatt', 1.0)]

kitsap_attraction_adjustments = [('hbw1att',0.05),
                         ('hbw2att',0.05),
                         ('hbw3att',0.05),
                         ('hbw4att', 0.05),
                         ('colatt',0.0),
                         ('hspatt',0.05),
                         ('schatt', 0.0),
                         ('hboatt', 0.05),
                         ('otoatt', 0.0),
                         ('wtoatt', 0.0),
                         ('mtkatt', 0.0),
                         ('htkatt', 0.0)]

regional_production_adjustments = [('hbw1pro',1.0),
                         ('hbw2pro',1.0),
                         ('hbw3pro',1.0),
                         ('hbw4pro', 1.0),
                         ('colpro',1.0),
                         ('hsppro',1.0),
                         ('schpro', 1.0),
                         ('hbopro', 1.0),
                         ('otopro', 1.0),
                         ('wtopro', 1.0),
                         ('mtkpro', 0.75),
                         ('htkpro', 1.0)]

kitsap_production_adjustments = [('hbw1pro',-0.05),
                         ('hbw2pro',-0.05),
                         ('hbw3pro',-0.05),
                         ('hbw4pro',-0.05),
                         ('colpro',-0.05),
                         ('hsppro',-0.05),
                         ('schpro',-0.05),
                         ('hbopro',-0.05),
                         ('otopro',-0.05),
                         ('wtopro',-0.05),
                         ('mtkpro', 0.0),
                         ('htkpro', 0.0)]



