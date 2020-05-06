# Inputs for the Trip Generation by Parcel and Households
# Created by Puget Sound Regional Council Staff
# Updated November 2019

import os

# Land Use Information
model_year = 2014
taz_system = 'PSRC 3700 ZOne System'
land_use_product = 'Land Use Vision 2.0 LODES'

taz_attribute = 'TAZ'

# Zone system Inputs
hightaz=3700
lowstation=3733
highstation=3750
lowpnr=3751
highpnr=4000

# External Zone Dictionary PSRC Zone is Key, New Zone System number is value
external_ids = {3733:3733,
                3734:3734,
                3735:3735,
                3736:3736,
                3737:3737,
                3738:3738,
                3739:3739,
                3740:3740,
                3741:3741,
                3742:3742,
                3743:3743,
                3744:3744,
                3745:3745,
                3746:3746,
                3747:3747,
                3748:3748,
                3749:3749,
                3750:3750}

i5_station = 3733

# Seatac Airport Zone Dictionary PSRC Zone is Key, New Zone System number is value
seatac_id = {983:983}

# JBLM Gate Zone Dictionary PSRC Zone is Key, New Zone System number is value
jblm_ids = {3061:3061,
            3070:3070,
            3346:3346,
            3348:3348,
            3349:3349,
            3350:3350,
            3351:3351,
            3352:3352,
            3353:3353,
            3354:3354,
            3355:3355,
            3356:3356}

# Input Directories
model_directory = os.getcwd()
input_directory = os.path.join(model_directory, 'input',str(model_year))
output_directory = os.path.join(model_directory, 'output',str(model_year))
gis_directory = 'W:\\geodata'
rates_directory = os.path.join(model_directory, 'rates')

# GIS layers for spatial joins
taz_shapefile = os.path.join(gis_directory, 'forecast','taz2010.shp')
block_shapefile = os.path.join(gis_directory,'census','Block','block2010.shp')
county_shapefile = os.path.join(gis_directory, 'political','countybackground.shp')
atri_shapefile = os.path.join(model_directory, 'input','atri','zones.shp')
state_plane = 'epsg:2285'

# Create the output directory for the trip generation results
if not os.path.exists(output_directory):
    os.makedirs(output_directory)

# Person, Household, Parcel and Block Level input files
hh_person = os.path.join(input_directory, 'hh_and_persons.h5')
parcel_file = os.path.join(input_directory, 'parcels_urbansim.txt')
model_files = os.path.join(input_directory, 'travel_model_inputs.db')

# Growth Rates to use for adjsuting input files for specific forecast years
special_generator_rate = 0.0135
group_quarters_rate = 0.0034
enlisted_personnel_rate = 0.0000
jblm_rate = 0.0000
external_rate = 0.0096
truck_rate = 0.0135

# Trip Rates
hh_rates = os.path.join(rates_directory,'hh_rates.csv')
sch_rates = os.path.join(rates_directory,'school_rates.csv')
coll_rates = os.path.join(rates_directory,'college_rates.csv')
gq_rates = os.path.join(rates_directory,'gq_rates.csv')
enlisted_rates = os.path.join(rates_directory,'enlisted_rates.csv')
employment_based_production_rates = os.path.join(rates_directory,'job_productions.csv')
employment_based_attraction_rates = os.path.join(rates_directory,'job_attractions.csv')
trip_rate_adjustments = os.path.join(rates_directory,'rate_adjustments.csv')

# Break points for classifications
# Income in 2014 $'s
low_income = 37000
medium_income = 74000
high_income = 111000

# Aiport Trip Rates
air_people = 0.02112
air_jobs = 0.01486

# Dictionaries, Lists

# Parcel Columns to use and what to rename them
original_parcel_columns = ['parcelid','xcoord_p','ycoord_p','empedu_p','empfoo_p','empgov_p','empind_p','empmed_p','empofc_p','empret_p','emprsc_p','empsvc_p','empoth_p','emptot_p','stugrd_p','stuhgh_p','stuuni_p']
updated_parcel_columns = ['parcel-id','xcoord','ycoord','education','food-services','government','industrial','medical','office','retail','resources','services','other','total-jobs','k-8','high-school','university']

# Lists for Group Quarters
trip_productions = ['hbw1pro','hbw2pro','hbw3pro','hbw4pro','colpro','hsppro','hbopro','schpro','otopro','wtopro']
trip_attractions = ['hbw1att','hbw2att','hbw3att','hbw4att','colatt','hspatt','hboatt','schatt','otoatt','wtoatt']
employment_categories = ['retail','food-services','government','office','services','industrial','education','medical','other','university','total-hh','total-jobs','total-people']

# Lists for HH and Person Files
hh_variables=['hhno','hhsize','hhparcel','hhincome']
person_variables=['pno','hhno','pptyp']

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
                   ('htkpro','heavy truck productions'),
                   ('cvhpro','commercial vehicle productions')]

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
                   ('htkatt','heavy truck attractions'),
                   ('cvhatt','commercial vehicle attractions')]

airport_4k = [('airport','SeaTac Airport Trips')]

balance_to_productions = ['hbw1','hbw2','hbw3','hbw4','hsp','hbo','oto','wto','mtk','htk','cvh']
balance_to_attractions = ['col','sch']