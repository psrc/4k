if exist *.ind erase *.ind
REM begin congested assignments
start batchfiles\congested\am_parallel_assign.bat
start batchfiles\congested\md_parallel_assign.bat
start batchfiles\congested\pm_parallel_assign.bat
start batchfiles\congested\ev_parallel_assign.bat
start batchfiles\congested\ni_parallel_assign.bat