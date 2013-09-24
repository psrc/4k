REM construct pnr trip tables in parallel
REM income 1
call batchfiles\pnr_income1_trip_tables_setup.bat
REM income 2
call batchfiles\pnr_income2_trip_tables_setup.bat
REM income 3
call batchfiles\pnr_income3_trip_tables_setup.bat
REM income 4
call batchfiles\pnr_income4_trip_tables_setup.bat
REM erase all existing indicator (.ind) files
if exist *.ind erase *.ind
REM income 1
start batchfiles\pnr_income1_trip_tables.bat
REM income 2
start batchfiles\pnr_income2_trip_tables.bat
REM income 3
start batchfiles\pnr_income3_trip_tables.bat
REM income 4
start batchfiles\pnr_income4_trip_tables.bat