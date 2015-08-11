REM Puget Sound 4k: Trip Based Model
REM Created August 2015
REM File created by PSRC staff
REM Batch file to SKim Auto Network for Tolls Paid
REM Runs in Parallel
if exist *.ind erase *.ind
start batchfiles\toll_skims\am_toll_skims.bat
start batchfiles\toll_skims\md_toll_skims.bat
start batchfiles\toll_skims\pm_toll_skims.bat
start batchfiles\toll_skims\ev_toll_skims.bat
start batchfiles\toll_skims\ni_toll_skims.bat
