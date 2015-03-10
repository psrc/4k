REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM File created by PSRC staff
REM Batch file to create auto access portion of trip tables

REM First Set-up in Sequence
call batchfiles\am_auto_trip_tables_setup.bat
call batchfiles\md_auto_trip_tables_setup.bat
call batchfiles\pm_auto_trip_tables_setup.bat
call batchfiles\ev_auto_trip_tables_setup.bat
call batchfiles\ni_auto_trip_tables_setup.bat

REM Create Trip Tables in Parallel
if exist *.ind erase *.ind
start batchfiles\am_auto_trip_tables.bat
start batchfiles\md_auto_trip_tables.bat
start batchfiles\pm_auto_trip_tables.bat
start batchfiles\ev_auto_trip_tables.bat
start batchfiles\ni_auto_trip_tables.bat
