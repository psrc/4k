REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM File created by PSRC staff
REM Batch file to run the final iteration of the travel model.
REM Final Skims are not averaged with the previous iteration results.

REM Trip Distribution
cd distribution
call batchfiles\trip_distribution.bat
cd ..
echo Final Iteration Trip Distribution completed on %date% at %time%. >> psrc_4k_log.txt

REM Mode Choice
cd modechoice
call batchfiles\mode_choice.bat
cd ..
echo Final Iteration Mode Choice completed on %date% at %time%. >> psrc_4k_log.txt

REM Time of Day
cd timeofday
call batchfiles\tod\time_of_day_model.bat
call batchfiles\check\tod_completion_check.bat
cd ..
echo Final Iteration Time of Day completed on %date% at %time%. >> psrc_4k_log.txt

REM Park and Ride Trip Tables
cd triptables\parkandride
call batchfiles\pnr_trip_tables.bat
call batchfiles\pnr_trip_tables_completion_check.bat
cd ..\..
echo Final Iteration Park and Ride Trip Tables completed on %date% at %time%. >> psrc_4k_log.txt

REM Trip Tables
cd triptables\all
call batchfiles\trip_tables.bat
cd ..\..
echo Final Iteration Trip Tables completed on %date% at %time%. >> psrc_4k_log.txt

REM Auto Assignments
cd assignments\auto
call batchfiles\setup\congested\congested_assignment_setup.bat
call batchfiles\congested\parallel_congested_assign.bat
call batchfiles\check\assignment_completion_check.bat
cd ..\..
echo Final Iteration Auto Assignments completed on %date% at %time%. >> psrc_4k_log.txt

REM Transit Assignments
cd assignments\transit
call batchfiles\congested\congested_transit_assign.bat
cd ..\..
echo Final Iteration Transit Assignments completed on %date% at %time%. >> psrc_4k_log.txt

REM Create Auto Skims (No Skim Averaging occurs in this Iteration)
cd skims\auto
call batchfiles\basic\auto_skims.bat
call batchfiles\check\auto_skim_completion_check.bat
cd ..\..
echo Final Iteration Auto Skims completed on %date% at %time%. >> psrc_4k_log.txt

REM Create Bi-Directional Skims
cd skims\bidirectional
call batchfiles\bidirectional_skims.bat
cd ..\..
echo Final Iteration Bi-Directional Skims completed on %date% at %time%. >> psrc_4k_log.txt

REM Create Transit Skims
cd skims\transit
call batchfiles\basic\basic_transit_skims.bat
cd ..\..
echo Final Iteration Transit Skims completed on %date% at %time%. >> psrc_4k_log.txt

REM Create Park and Ride Skims
cd skims\pnr
call batchfiles\pnr_skims.bat
call batchfiles\pnr_skim_completion_check.bat
cd ..\..
echo Final Iteration Park and Ride Skims completed on %date% at %time%. >> psrc_4k_log.txt