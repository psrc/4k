REM erase all existing indicator (.ind) files
if exist *.ind erase *.ind
REM begin freeflow assignments
REM start am assignment
start batchfiles\freeflow\am_parallel_ff_assign.bat
REM start md assignment
start batchfiles\freeflow\md_parallel_ff_assign.bat
REM start pm assignment
start batchfiles\freeflow\pm_parallel_ff_assign.bat
REM start ev assignment
start batchfiles\freeflow\ev_parallel_ff_assign.bat
REM start ni assignment
start batchfiles\freeflow\ni_parallel_ff_assign.bat