REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM File created by PSRC staff
REM Batch file to create auto access portion of trip tables

REM First Set-up in Sequence
call batchfiles\pnr_income1_trip_tables_setup.bat
call batchfiles\pnr_income2_trip_tables_setup.bat
call batchfiles\pnr_income3_trip_tables_setup.bat
call batchfiles\pnr_income4_trip_tables_setup.bat

REM Create Trip Tables in Parallel
if exist *.ind erase *.ind
start batchfiles\pnr_income1_trip_tables.bat
start batchfiles\pnr_income2_trip_tables.bat
start batchfiles\pnr_income3_trip_tables.bat
start batchfiles\pnr_income4_trip_tables.bat