REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM File created by PSRC staff
REM Batch file to create all necessary databanks
REM Also runs free-flow assignments and skims

REM Creates all the databanks
call batchfiles\setup\create_banks.bat

REM Free-flow auto assignments
cd assignments\auto
call batchfiles\setup\freeflow\ff_assignment_setup.bat
call batchfiles\freeflow\parallel_ff_assign.bat
call batchfiles\check\assignment_completion_check.bat
cd ..\..
echo Free-Flow Auto Assignments completed on %date% at %time%. >> psrc_4k_log.txt

REM Free-flow transit assignments
cd assignments\transit
call batchfiles\freeflow\ff_transit_assign.bat
cd ..\..
echo Free-Flow Transit Assignments completed on %date% at %time%. >> psrc_4k_log.txt

REM Free-flow non-motorized assignments
cd assignments\nonmotorized
call batchfiles\am_non_motorized_assignment.bat
cd ..\..
echo Free-Flow Walk/Bike Assignments completed on %date% at %time%. >> psrc_4k_log.txt

REM Calculate Intrazonal Skims
cd skims\iz_tt
call batchfiles\iz_tt_skims.bat
cd ..\..
echo Free-Flow Intrazonal Skims completed on %date% at %time%. >> psrc_4k_log.txt

REM Calculate Auto Skims
cd skims\auto
call batchfiles\basic\auto_skims.bat
call batchfiles\check\auto_skim_completion_check.bat
cd ..\..
echo Free-Flow Auto Skims completed on %date% at %time%. >> psrc_4k_log.txt

REM Calculate Bi-Directional Skims
cd skims\bidirectional
call batchfiles\bidirectional_skims.bat
cd ..\..
echo Free-Flow Bi-Directional Skims completed on %date% at %time%. >> psrc_4k_log.txt

REM Calculate Transit Skims
cd skims\transit
call batchfiles\basic\basic_transit_skims.bat
cd ..\..
echo Free-Flow Transit Skims completed on %date% at %time%. >> psrc_4k_log.txt

REM Calculate Walk and Bike Skims
cd skims\nonmotorized
call batchfiles\am_non_motorized_skims.bat
cd ..\..
echo Free-Flow Walk and Bike Skims completed on %date% at %time%. >> psrc_4k_log.txt

REM Calculate Park and Ride Skims
cd skims\pnr
call batchfiles\pnr_skims.bat
call batchfiles\pnr_skim_completion_check.bat
cd ..\..
echo Free-Flow Park and Ride Skims completed on %date% at %time%. >> psrc_4k_log.txt
