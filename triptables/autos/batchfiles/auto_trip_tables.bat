REM construct auto trip tables in parallel
REM AM
call batchfiles\am_auto_trip_tables_setup.bat
REM MD
call batchfiles\md_auto_trip_tables_setup.bat
REM PM
call batchfiles\pm_auto_trip_tables_setup.bat
REM EV
call batchfiles\ev_auto_trip_tables_setup.bat
REM NI
call batchfiles\ni_auto_trip_tables_setup.bat
REM erase all existing indicator (.ind) files
if exist *.ind erase *.ind
REM start AM
start batchfiles\am_auto_trip_tables.bat
REM start MD
start batchfiles\md_auto_trip_tables.bat
REM start PM
start batchfiles\pm_auto_trip_tables.bat
REM start EV
start batchfiles\ev_auto_trip_tables.bat
REM start NI
start batchfiles\ni_auto_trip_tables.bat
