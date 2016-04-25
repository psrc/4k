@echo off

REM Puget Sound 4k: Trip Generation
REM Created on December 5, 2014
REM Revised on March 7, 2016
REM Parameters are passed to the Batch File via the Control File "tripgen.ctl"

REM Test to see if the control file exists, if not exit, let the User know and create a sample file to use
if Not exist tripgen.ctl (
     echo No Control File was found, Trip Generation run was exited.
     exit /b
)

REM Get Path and Zone Configurations from the Master Control file
FOR /F "tokens=1* delims==" %%A IN ('FINDSTR /R /X /C:"[^=][^=]*=.*" "tripgen.ctl"') DO SET %%A=%%~B

REM Check if the path's actually exist and if the input files are present

if Not exist %Inputs% (
     echo The path to the trip generation files %Inputs% does not exist.
     echo Double check tripgen.ctl.
     exit /b 
)
if Not exist %Outputs% (
     echo The path to the trip generation files %Outputs% does not exist.
     echo Double check tripgen.ctl.
     exit /b 
)
	 
REM Delete report, summary and output files if they exist
if exist *.txt erase *.txt
if exist emmebank erase emmebank
if exist *.rpt erase *.rpt
if exist summary\*.rpt erase summary\*.rpt
if exist %Outputs%\tripends\*.in erase %Outputs%\tripends\*.in
if exist %Outputs%\vehicleavailability\*.in erase %Outputs%\vehicleavailability\*.in

REM Log General Information about the model run and its inputs
echo Trip Generation Model began on %date% at %time%. >> trip_gen_log.txt
echo The Trip Generation Rates in the model run are based on the %RatesYear% HH Travel Survey. >> trip_gen_log.txt
echo The land use inputs used are based on the %LUYear% %LURelease% %LUForecast% Forecast Product>> trip_gen_log.txt
echo All Land Use input files are located at %Inputs%. >> trip_gen_log.txt
echo Resulting Trip End Files are located at %Outputs%\tripends. >> trip_gen_log.txt

REM Create a New Databank, Read in Network, initialize matrices and input matrix data
call emme -ng newbank -m macros\1_create_databank.mac
call emme -ng 000 -m macros\2_generate_network.mac %Inputs%
call emme -ng 000 -m macros\3_initialize_inputs.mac %Inputs%

REM Household Cross-Classification
call emme -ng 000 -m macros\4_hh_cross_classification.mac
call emme -ng 000 -m macros\5_vehicle_cross_classification.mac

REM Household Trip Generation
call emme -ng 000 -m macros\6_hh_trip_productions.mac %highstation%
call emme -ng 000 -m macros\7_hh_trip_attractions.mac %highstation%
call emme -ng 000 -m macros\8_supplementals.mac %Inputs% %highstation%
call emme -ng 000 -m macros\9_balance_trips.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%

REM Truck Trip Generation
call emme -ng 000 -m macros\10_truck_generation.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%

REM Vehicle Availability
call emme -ng 000 -m macros\11_convert_hhemp_va_cross_classification.mac

REM SeaTac Airport Trip Generation
call emme -ng 000 -m macros\12_seatac_airport.mac %hightaz% %seatac%

REM Output Files for use in Travel Model
call emme -ng 000 -m macros\13_output_tripends.mac %Outputs% %highstation%
call emme -ng 000 -m macros\14_output_vehmtx.mac %Outputs%

REM Summary Files
call emme -ng 000 -m macros\15_trip_generation_summary.mac %highstation%
call emme -ng 000 -m macros\16_output_scalars.mac

echo Trip Generation Model ended on %date% at %time% without any errors. >> trip_gen_log.txt

REM Remove the intermediate Report Files if requested in control file
if %DeleteReports% == Yes (
     echo Interim Report Files were deleted >> trip_gen_log.txt
     erase *rpt
)

if %DeleteBank% == Yes (
     echo Emme Databank Files were deleted >> trip_gen_log.txt
     erase emmebank
	 erase errors
	 erase d002.in
	 erase usemacro
	 erase emmemat\*.emx
)

REM Copy the Trip Generation Log File to the server location with the Trip Ends
copy /Y trip_gen_log.txt %Outputs%\tripends
