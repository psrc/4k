REM construct pnr trip tables in parallel
REM Income 1
call batchfiles\pnr_income1_trip_tables_setup.bat
REM Income 2
call batchfiles\pnr_income2_trip_tables_setup.bat
REM Income 3
call batchfiles\pnr_income3_trip_tables_setup.bat
REM Income 4
call batchfiles\pnr_income4_trip_tables_setup.bat
REM erase all existing indicator (.ind) files
if exist *.ind erase *.ind
REM Income 1
start batchfiles\pnr_income1_trip_tables.bat
REM Income 2
start batchfiles\pnr_income2_trip_tables.bat
REM Income 3
start batchfiles\pnr_income3_trip_tables.bat
REM Income 4
start batchfiles\pnr_income4_trip_tables.bat