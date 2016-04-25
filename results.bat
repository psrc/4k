REM Puget Sound 4k: Trip Based Model
REM Updated June 2015
REM Created by PSRC staff
REM Model Runs with 4 Global Internal Iterations and a Final set of Assignments and Skims

REM Start of Model Run
echo PSRC 4k Model Began on %date% at %time%. > psrc_4k_log.txt

REM Parameters are passed to the Batch File via the Control File "4k.ctl"
for /f "tokens=1,2 delims==" %%a in (4k.ctl) do SET %%a=%%b

set modeldir=%cd%

REM Create the Summary Bank if called for and populate
if %SummaryBank% == Yes (
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
     
	 REM Summary Results
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
	 call emme -ng 000 -m macros\2-10_arterial_travel_times.mac
	 call emme -ng 000 -m macros\2-11_freeway_travel_times.mac
	 call emme -ng 000 -m macros\2-12_accident_costs.mac
	 call emme -ng 000 -m macros\2-13_emission_costs.mac
	 call emme -ng 000 -m macros\2-14_noise_costs.mac
	 call emme -ng 000 -m macros\2-15_input_summary.mac 
	 call emme -ng 000 -m macros\2-16_daily_count.mac 
	 
	 REM Create macro, input and error list files
	 if %SummaryBank% == Yes (
      dir *.mac /s > results\macro_list.txt
      dir input /s > results\input_list.txt
      dir errors/s > results\error_list.txt
	)

	 call emme -ng 000 -m macros\3-0_output_results.mac
	 
	 
)
cd ..

cd %modeldir%
echo PSRC 4k Model Ended on %date% at %time%. >> psrc_4k_log.txt