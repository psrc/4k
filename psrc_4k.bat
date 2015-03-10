REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM Created by PSRC staff
REM Model Runs with 4 Global Internal Iterations and 1 Final set of Assignments

REM Start of Model Run
echo PSRC 4k Model Began on %date% at %time%. > psrc_4k_log.txt

REM Parameters are passed to the Batch File via the Control File "4k.ctl"
FOR /F "tokens=1* delims==" %%A IN ('FINDSTR /R /X /C:"[^=][^=]*=.*" "4k.ctl"') DO SET %%A=%%~B

REM Check for the Summaries Folder and Add if necessary
set modeldir=%cd%
if Not exist %modeldir%\summaries (
     mkdir %modeldir%\summaries\assignments\auto
	 mkdir %modeldir%\summaries\distribution
	 mkdir %modeldir%\summaries\modechoice
	 mkdir %modeldir%\summaries\triptables
)

REM Check for the Input Folder and Add if necessary
if Not exist %modeldir%\input (
     mkdir %modeldir%\input
)
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
set brgap=0.05
call batchfiles\model\initial_iteration.bat
call batchfiles\reports\report_rename.bat %iternum%

REM Feedback Iteration
set iternum=2
set brgap=0.01
call batchfiles\model\feedback_iteration.bat
call batchfiles\reports\report_rename.bat %iternum%

REM Feedback Iteration
set iternum=3
set brgap=0.01
call batchfiles\model\feedback_iteration.bat
call batchfiles\reports\report_rename.bat %iternum%

REM Feedback Iteration
set iternum=4
set brgap=0.01
call batchfiles\model\feedback_iteration.bat
call batchfiles\reports\report_rename.bat %iternum%

REM Final Iteration
set iternum=f
set brgap=0.01
call batchfiles\model\final_iteration.bat
call batchfiles\reports\report_rename.bat %iternum%

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
	 call emme -ng 000 -m macros\1-2_input_triptables.mac
	 call emme -ng 000 -m macros\1-3_am_transit_assignment.mac
	 call emme -ng 000 -m macros\1-4_md_transit_assignment.mac
     call emme -ng 000 -m macros\2-0_regional_link_summary.mac
	 call emme -ng 000 -m macros\2-1_screenline_summary.mac
	 call emme -ng 000 -m macros\2-2_regional_triptable_summary.mac
	 call emme -ng 000 -m macros\2-3_trip_distribution_summary.mac %hightaz%
	 call emme -ng 000 -m macros\2-4_modechoice_summary.mac %hightaz%
	 call emme -ng 000 -m macros\3-0_output_results.mac
)
cd ..
echo PSRC 4k Model Ended on %date% at %time%. >> psrc_4k_log.txt