REM erase all existing indicator (.ind) files
if exist *.ind erase *.ind
REM begin auto feedback skims
REM start AM auto skims
start batchfiles\feedback\am_auto_feedback_skims.bat
REM start MD auto skims
start batchfiles\feedback\md_auto_feedback_skims.bat
REM start PM auto skims
start batchfiles\feedback\pm_auto_feedback_skims.bat
REM start EV auto skims
start batchfiles\feedback\ev_auto_feedback_skims.bat
REM start NI auto skims
start batchfiles\feedback\ni_auto_feedback_skims.bat
