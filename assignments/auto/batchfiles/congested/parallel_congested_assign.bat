REM erase all existing indicator (.ind) files
if exist *.ind erase *.ind
REM begin congested assignments
REM start AM assignment
start batchfiles\congested\am_parallel_assign.bat
REM start MD assignment
start batchfiles\congested\md_parallel_assign.bat
REM start PM assignment
start batchfiles\congested\pm_parallel_assign.bat
REM start EV assignment
start batchfiles\congested\ev_parallel_assign.bat
REM start NI assignment
start batchfiles\congested\ni_parallel_assign.bat