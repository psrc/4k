REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM Created by PSRC staff
REM Model Runs with 4 Global Internal Iterations and a Final set of Assignments and Skims

REM Start of Model Run
echo PSRC 4k Model Began on %date% at %time%. > psrc_4k_log.txt

REM Parameters are passed to the Batch File via the Control File "4k.ctl"
FOR /F "tokens=1* delims==" %%A IN ('FINDSTR /R /X /C:"[^=][^=]*=.*" "4k.ctl"') DO SET %%A=%%~B

REM Give some basic information about the inputs used
echo Land used inputs are for year %LUYear%. >> psrc_4k_log.txt
echo Inputs for this model run are located at %InputPath%. >> psrc_4k_log.txt

set modeldir=%cd%

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
set brgap=0.01
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
set iternum=5
set brgap=0.01
call batchfiles\model\final_iteration.bat
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
	 call emme -ng 000 -m macros\1-2_input_triptables.mac
     call emme -ng 000 -m macros\2-0_regional_link_summary.mac
	 call emme -ng 000 -m macros\2-1_screenline_summary.mac
	 call emme -ng 000 -m macros\2-2_regional_triptable_summary.mac
	 call emme -ng 000 -m macros\2-3_trip_distribution_summary.mac %hightaz%
	 call emme -ng 000 -m macros\2-4_modechoice_summary.mac %hightaz%
	 call emme -ng 000 -m macros\2-5_transit_summary.mac
	 call emme -ng 000 -m macros\2-6_trip_length_distribution_summary.mac %hightaz%
	 call emme -ng 000 -m macros\2-7_work_modechoice_centers.mac %hightaz%
	 call emme -ng 000 -m macros\2-8_nonwork_modechoice_centers.mac %hightaz%
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