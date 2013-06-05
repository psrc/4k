REM run PSRC travel demand model
REM
if exist model_start_time.out erase model_start_time.out
echo model start time: > model_start_time.out
time /t >> model_start_time.out
REM
REM run model setup
call batchfiles\setup\model_setup_tg_beta.bat
REM
REM run global model iteration
call batchfiles\model\initial_global_iteration_tg_beta.bat
call batchfiles\reports\report_rename_iteration_1.bat
REM
REM run feedback model iteration #1
call batchfiles\model\feedback_global_iteration_tg_beta.bat
call batchfiles\reports\report_rename_iteration_2.bat
REM
REM run feedback model iteration #2
call batchfiles\model\feedback_global_iteration_tg_beta.bat
call batchfiles\reports\report_rename_iteration_3.bat
REM
REM run feedback model iteration #3
call batchfiles\model\feedback_global_iteration_tg_beta.bat
call batchfiles\reports\report_rename_iteration_4.bat
REM
REM run global model iteration
call batchfiles\model\final_global_iteration_tg_beta.bat
call batchfiles\reports\report_rename_iteration_f.bat
REM
if exist model_end_time.out erase model_end_time.out
echo end time: > model_end_time.out
time /t >> model_end_time.out