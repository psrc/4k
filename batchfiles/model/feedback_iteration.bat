REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM File created by PSRC staff
REM Batch file to run the feedback iterations of the travel model
REM Skims are averaged with the previous iteration results.

REM Trip Distribution
cd distribution
call batchfiles\trip_distribution.bat
cd ..
echo Iteration %iternum% Trip Distribution completed on %date% at %time%. >> psrc_4k_log.txt

REM Mode Choice
cd modechoice
call batchfiles\mode_choice.bat
cd ..
echo Iteration %iternum% Mode Choice completed on %date% at %time%. >> psrc_4k_log.txt

REM Time of Day
cd timeofday
call batchfiles\time_of_day_model.bat
call batchfiles\tod_completion_check.bat
cd ..
echo Iteration %iternum% Time of Day completed on %date% at %time%. >> psrc_4k_log.txt

REM Park and Ride Trip Tables
cd triptables\parkandride
call batchfiles\pnr_trip_tables.bat
call batchfiles\pnr_trip_tables_completion_check.bat
cd ..\..
echo Iteration %iternum% Park and Ride Trip Tables completed on %date% at %time%. >> psrc_4k_log.txt

REM Trip Tables
cd triptables\all
call batchfiles\trip_tables.bat
cd ..\..
echo Iteration %iternum% Trip Tables completed on %date% at %time%. >> psrc_4k_log.txt

REM Assignments
cd assignments
call batchfiles\parallel_assignment.bat
call batchfiles\assignment_completion_check.bat
cd ..
echo Iteration %iternum% Assignments completed on %date% at %time%. >> psrc_4k_log.txt

REM Create Auto Skims (Skim Averaging occurs in this Iteration)
cd skims\auto
call batchfiles\auto_skims_feedback.bat
call batchfiles\auto_skim_completion_check.bat
cd ..\..
echo Iteration %iternum% Auto Skims completed on %date% at %time%. >> psrc_4k_log.txt

REM Create Bi-Directional Skims
cd skims\bidirectional
call batchfiles\bidirectional_skims.bat
cd ..\..
echo Iteration %iternum% Bi-Directional Skims completed on %date% at %time%. >> psrc_4k_log.txt

REM Create Transit Skims
cd skims\transit
call batchfiles\feedback\feedback_transit_skims.bat
cd ..\..
echo Iteration %iternum% Transit Skims completed on %date% at %time%. >> psrc_4k_log.txt

REM Create Park and Ride Skims
cd skims\pnr
call batchfiles\pnr_skims.bat
call batchfiles\pnr_skim_completion_check.bat
cd ..\..
echo Iteration %iternum% Park and Ride Skims completed on %date% at %time%. >> psrc_4k_log.txt
