REM erase all existing indicator (.ind) files
if exist *.ind erase *.ind
REM begin freeflow assignments
REM start AM assignment
start batchfiles\freeflow\am_parallel_ff_assign.bat
REM start MD assignment
start batchfiles\freeflow\md_parallel_ff_assign.bat
REM start PM assignment
start batchfiles\freeflow\pm_parallel_ff_assign.bat
REM start EV assignment
start batchfiles\freeflow\ev_parallel_ff_assign.bat
REM start NI assignment
start batchfiles\freeflow\ni_parallel_ff_assign.bat