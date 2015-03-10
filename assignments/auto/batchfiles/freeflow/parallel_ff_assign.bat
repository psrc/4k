REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM File created by PSRC staff
REM Batch file to run free-flow assignments in parallel (start is used)
if exist *.ind erase *.ind
start batchfiles\freeflow\am_parallel_ff_assign.bat
start batchfiles\freeflow\md_parallel_ff_assign.bat
start batchfiles\freeflow\pm_parallel_ff_assign.bat
start batchfiles\freeflow\ev_parallel_ff_assign.bat
start batchfiles\freeflow\ni_parallel_ff_assign.bat