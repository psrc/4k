REM Puget Sound 4k: Trip Based Model
REM Updated June 2015
REM Created by PSRC staff
REM Results Banks

REM Parameters are passed to the Batch File via the Control File "4k.ctl"
for /f "tokens=1,2 delims==" %%a in (4k.ctl) do SET %%a=%%b

set modeldir=%cd%

REM Create the Summary Bank if called for and populate
cd results

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\1-0_import_scenarios.mac
call emme -ng 000 -m macros\1-1_initialize_matrices.mac
if %USim% == Yes call emme -ng 000 -m macros\1-1a_initialize_usim_matrices.mac
call emme -ng 000 -m macros\1-2_input_triptables.mac
if %USim% == Yes call emme -ng 000 -m macros\1-2a_input_usim_triptables.mac
call emme -ng 000 -m macros\2-0_regional_link_summary.mac
call emme -ng 000 -m macros\2-1_screenline_summary.mac
call emme -ng 000 -m macros\2-2_regional_triptable_summary.mac
call emme -ng 000 -m macros\2-3_trip_distribution_summary.mac %hightaz%
call emme -ng 000 -m macros\2-4_modechoice_summary.mac %hightaz%
call emme -ng 000 -m macros\2-5_transit_summary.mac
call emme -ng 000 -m macros\2-6_trip_length_distribution_summary.mac %hightaz%
call emme -ng 000 -m macros\2-7_work_modechoice_centers.mac %hightaz%
call emme -ng 000 -m macros\2-8_nonwork_modechoice_centers.mac %hightaz%
call emme -ng 000 -m macros\2-9_transit_operators.mac
call emme -ng 000 -m macros\3-0_output_results.mac

cd ..
