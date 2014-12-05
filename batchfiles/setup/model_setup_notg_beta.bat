cd networks
call batchfiles\create_networks.bat
cd ..
cd assignments\auto
call batchfiles\setup\freeflow\ff_assignment_setup.bat
call batchfiles\freeflow\parallel_ff_assign.bat
call batchfiles\check\assignment_completion_check.bat
cd ..\..
cd assignments\transit
call batchfiles\freeflow\ff_transit_assign.bat
cd ..\..
cd assignments\nonmotorized
call batchfiles\am_non_motorized_assignment.bat
cd ..\..
cd skims\iz_tt
call batchfiles\iz_tt_skims.bat
cd ..\..
cd skims\auto
call batchfiles\basic\auto_skims.bat
call batchfiles\check\auto_skim_completion_check.bat
cd ..\..
cd skims\bidirectional
call batchfiles\bidirectional_skims.bat
cd ..\..
cd skims\transit
call batchfiles\basic\basic_transit_skims.bat
cd ..\..
cd skims\nonmotorized
call batchfiles\am_non_motorized_skims.bat
cd ..\..
cd skims\pnr
call batchfiles\pnr_skims.bat
call batchfiles\pnr_skim_completion_check.bat
cd ..\..
cd generation
REM call batchfiles\trip_generation.bat
cd ..
cd trucks
REM call batchfiles\truck_generation_tg.bat
cd ..