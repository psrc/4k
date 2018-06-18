# Inputs for the Trip Generation by Parcel and Households
# Created by Puget Sound Regional Council Staff
# March 2018

import os

# Land Use Information
model_year = 2040
taz_system = 'PSRC 3700 Zone System'
land_use_product = 'Land Use Vision 2.0 LODES'

# Input Files
model_directory = 'C:/coding/trip-generation'
input_directory = model_directory+'/input/'+str(model_year)
output_directory = model_directory+'/output/'+str(model_year)

# Create the output directory for the trip generation results
if not os.path.exists(output_directory):
    os.makedirs(output_directory)

# Person, Household, Parcel and Block Level input files
hh_person = input_directory+'/hh_and_persons.h5'
parcel_file = input_directory+'/parcels_urbansim.txt'
model_files = input_directory+'/travel_model_inputs.db'

# Growth Rates to use for adjsuting input files for specific forecast years
special_generator_rate = 0.0135
group_quarters_rate = 0.0034
enlisted_personnel_rate = 0.0000
jblm_rate = 0.0000
external_rate = 0.0096
truck_rate = 0.0135

# Trip Rates
hh_rates = model_directory+'/rates/hh_rates.csv'
sch_rates = model_directory+'/rates/school_rates.csv'
coll_rates = model_directory+'/rates/college_rates.csv'
gq_rates = model_directory+'/rates/gq_rates.csv'
enlisted_rates = model_directory+'/rates/enlisted_rates.csv'
employment_based_production_rates = model_directory+'/rates/job_productions.csv'
employment_based_attraction_rates = model_directory+'/rates/job_attractions.csv'

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
original_parcel_columns = ['parcelid','xcoord_p','ycoord_p','taz_p','empedu_p','empfoo_p','empgov_p','empind_p','empmed_p','empofc_p','empret_p','emprsc_p','empsvc_p','empoth_p','emptot_p','stugrd_p','stuhgh_p','stuuni_p']
updated_parcel_columns = ['parcel-id','xcoord','ycoord','taz','education','food-services','government','industrial','medical','office','retail','resources','services','other','total-jobs','k-8','high-school','university']

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

regional_attraction_adjustments = [('hbw1att',1.10),
                         ('hbw2att',1.10),
                         ('hbw3att',1.10),
                         ('hbw4att', 1.10),
                         ('colatt',1.10),
                         ('hspatt',1.10),
                         ('schatt', 1.10),
                         ('hboatt', 1.10),
                         ('otoatt', 1.10),
                         ('wtoatt', 1.10),
                         ('mtkatt', 0.75),
                         ('htkatt', 1.0),
                         ('cvhatt', 1.0)]

kitsap_attraction_adjustments = [('hbw1att',0.15),
                         ('hbw2att',0.15),
                         ('hbw3att',0.15),
                         ('hbw4att', 0.15),
                         ('colatt',0.0),
                         ('hspatt',0.15),
                         ('schatt', 0.0),
                         ('hboatt', 0.15),
                         ('otoatt', 0.15),
                         ('wtoatt', 0.15),
                         ('mtkatt', 0.0),
                         ('htkatt', 0.0),
                         ('cvhatt', 0.0)]

regional_production_adjustments = [('hbw1pro',1.10),
                         ('hbw2pro',1.10),
                         ('hbw3pro',1.10),
                         ('hbw4pro', 1.10),
                         ('colpro',1.10),
                         ('hsppro',1.10),
                         ('schpro', 1.10),
                         ('hbopro', 1.10),
                         ('otopro', 1.10),
                         ('wtopro', 1.10),
                         ('mtkpro', 0.75),
                         ('htkpro', 1.0),
                         ('cvhpro', 1.0)]

kitsap_production_adjustments = [('hbw1pro', 0.0),
                         ('hbw2pro', 0.0),
                         ('hbw3pro', 0.0),
                         ('hbw4pro', 0.0),
                         ('colpro', 0.0),
                         ('hsppro', 0.0),
                         ('schpro', 0.0),
                         ('hbopro', 0.0),
                         ('otopro', 0.0),
                         ('wtopro', 0.0),
                         ('mtkpro', 0.0),
                         ('htkpro', 0.0),
                         ('cvhpro', 0.0)]



