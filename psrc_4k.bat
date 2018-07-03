REM Puget Sound 4k: Trip Based Model
REM Updated June 2015
REM Created by PSRC staff
REM Model Runs with 4 Global Internal Iterations and a Final set of Assignments and Skims

REM Start of Model Run
echo PSRC 4k Model Began on %date% at %time%. > psrc_4k_log.txt

REM Parameters are passed to the Batch File via the Control File "4k.ctl"
for /f "tokens=1,2 delims==" %%a in (4k.ctl) do SET %%a=%%b

REM Give some basic information about the inputs used
echo Land used inputs are for year %LUYear%. >> psrc_4k_log.txt
echo Inputs for this model run are located at %InputPath%. >> psrc_4k_log.txt

set modeldir=%cd%

REM Check for the Input Folder and Add if necessary
if Not exist %modeldir%\input mkdir %modeldir%\input

REM Check for the Assignment Folders and Add if they do not exist
if Not exist %modeldir%\assignments\am mkdir %modeldir%\assignments\am
if Not exist %modeldir%\assignments\md mkdir %modeldir%\assignments\md
if Not exist %modeldir%\assignments\pm mkdir %modeldir%\assignments\pm
if Not exist %modeldir%\assignments\ev mkdir %modeldir%\assignments\ev
if Not exist %modeldir%\assignments\ni mkdir %modeldir%\assignments\ni

REM Check for the Auto Skim Folders and Add if they do not exist
if Not exist %modeldir%\skims\auto\am mkdir %modeldir%\skims\auto\am
if Not exist %modeldir%\skims\auto\md mkdir %modeldir%\skims\auto\md
if Not exist %modeldir%\skims\auto\pm mkdir %modeldir%\skims\auto\pm
if Not exist %modeldir%\skims\auto\ev mkdir %modeldir%\skims\auto\ev
if Not exist %modeldir%\skims\auto\ni mkdir %modeldir%\skims\auto\ni

REM Check for the Bi-Directional Skim Folders and Add if it does not exist
if Not exist %modeldir%\skims\bidirectional\all mkdir %modeldir%\skims\bidirectional\all

REM Check for the PnR Skim Folders and Add if they do not exist
if Not exist %modeldir%\skims\pnr\income1 mkdir %modeldir%\skims\pnr\income1
if Not exist %modeldir%\skims\pnr\income2 mkdir %modeldir%\skims\pnr\income2
if Not exist %modeldir%\skims\pnr\income3 mkdir %modeldir%\skims\pnr\income3
if Not exist %modeldir%\skims\pnr\income4 mkdir %modeldir%\skims\pnr\income4

REM Copy the inputs to the local directory
cd input
xcopy "%InputPath%\*" /s /i /y
cd ..

REM Model Setup and Free-Flow Iteration
set iternum=0
call batchfiles\setup\model_setup.bat
call batchfiles\reports\report_rename.bat %iternum%

REM Initial Iteration
set iternum=1
call batchfiles\model\initial_iteration.bat
call batchfiles\nan\nan_check.bat
call batchfiles\reports\report_rename.bat %iternum%

REM Feedback Iteration
set iternum=2
call batchfiles\model\feedback_iteration.bat
call batchfiles\nan\nan_check.bat
call batchfiles\reports\report_rename.bat %iternum%

REM Feedback Iteration
set iternum=3
call batchfiles\model\feedback_iteration.bat
call batchfiles\nan\nan_check.bat
call batchfiles\reports\report_rename.bat %iternum%

REM Feedback Iteration
set iternum=4
call batchfiles\model\feedback_iteration.bat
call batchfiles\nan\nan_check.bat
call batchfiles\reports\report_rename.bat %iternum%

REM Final Iteration
set iternum=5
call batchfiles\model\final_iteration.bat
call batchfiles\nan\nan_check.bat
call batchfiles\reports\report_rename.bat f

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
	 call emme -ng 000 -m macros\2-15_input_summary.mac %LUYear%
	 call emme -ng 000 -m macros\2-16_daily_count.mac 
	 
	 REM Create macro, input and error list files
	 if %SummaryBank% == Yes (
      dir ..\*.mac /s > macro_list.txt
      dir ..\*.bat /s > macro_list.txt
      dir ..\input /s > input_list.txt
      dir ..\errors/s > error_list.txt
	)

	 call emme -ng 000 -m macros\3-0_output_results.mac
	 
	 
)
cd ..

REM Remove Databanks if called for in the control file
if %DeleteBank% == Yes (
     set modeldir=%cd%
	 FOR /F "tokens=*" %%A IN (%cd%%\batchfiles\setup\assignment_bank_list.txt) DO (
	 cd %modeldir%\%%A

	 REM Delete the Existing Files if present
     if exist emmebank erase emmebank
     if exist %modeldir%\%%A\emmemat rmdir %modeldir%\%%A\emmemat /s /q
     if exist PATHS* erase PATHS*
     if exist errors erase errors
	 if exist usemacro* erase usemacro*
     if exist *in erase *in
	 )
	 
	 cd %modeldir%
	 FOR /F "tokens=*" %%A IN (%cd%%\batchfiles\setup\other_bank_list.txt) DO (
	 cd %modeldir%\%%A
     if exist emmebank erase emmebank
     if exist %modeldir%\%%A\emmemat rmdir %modeldir%\%%A\emmemat /s /q
     if exist PATHS* erase PATHS*
     if exist errors erase errors
	 if exist usemacro* erase usemacro*
     if exist *in erase *in
	 )
)
cd %modeldir%

REM Remove Internal Report Files if called for in the control file
if %DeleteReports% == Yes (
     set modeldir=%cd%
	 FOR /F "tokens=*" %%A IN (%cd%%\batchfiles\setup\assignment_bank_list.txt) DO (
	 cd %modeldir%\%%A

	 REM Delete the Existing Files if present
     if exist *.rp* erase *.rp*
	 )
	 
	 cd %modeldir%
	 FOR /F "tokens=*" %%A IN (%cd%%\batchfiles\setup\other_bank_list.txt) DO (
	 cd %modeldir%\%%A
     if exist *.rp* erase *.rp*
	 )
)
cd %modeldir%
echo PSRC 4k Model Ended on %date% at %time%. >> psrc_4k_log.txt