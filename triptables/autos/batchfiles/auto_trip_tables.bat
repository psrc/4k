REM construct auto trip tables in parallel
REM am
call batchfiles\am_auto_trip_tables_setup.bat
REM md
call batchfiles\md_auto_trip_tables_setup.bat
REM pm
call batchfiles\pm_auto_trip_tables_setup.bat
REM ev
call batchfiles\ev_auto_trip_tables_setup.bat
REM ni
call batchfiles\ni_auto_trip_tables_setup.bat
REM erase all existing indicator (.ind) files
if exist *.ind erase *.ind
REM start am
start batchfiles\am_auto_trip_tables.bat
REM start md
start batchfiles\md_auto_trip_tables.bat
REM start pm
start batchfiles\pm_auto_trip_tables.bat
REM start ev
start batchfiles\ev_auto_trip_tables.bat
REM start ni
start batchfiles\ni_auto_trip_tables.bat
