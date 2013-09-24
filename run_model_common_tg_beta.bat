REM run PSRC travel demand model
REM set global parameters
REM highest internal taz number
set hightaz=%1
REM lowest external station number
set lowstation=%2
REM highest external station number
set highstation=%3
REM low end of pnr zone range
set lowpnr=%4
REM high end of pnr zone range
set highpnr=%5
REM assignment iterations
set assigniter=200
REM check for 'emlock*' files
call batchfiles\emlock\emlock_check.bat
REM reset model files files for zone system
call batchfiles\setup\model_run_reset_tg_beta.bat
REM delete matrices
call batchfiles\deletefiles\delete_matrix_files.bat
REM delete existing files
call batchfiles\deletefiles\delete_summary_report_files.bat
REM record model start time
if exist model_start_time.out erase model_start_time.out
echo full model start time: > model_start_time.out
time /t >> model_start_time.out
REM
REM run model setup
call batchfiles\setup\model_setup_tg_beta.bat
call batchfiles\reports\report_rename_iteration_0.bat
REM
REM run global model iteration
call batchfiles\model\initial_global_iteration_tg_beta.bat
call batchfiles\nan\nan_check.bat
call batchfiles\reports\report_rename_iteration_1.bat
REM
REM run feedback model iteration #1
call batchfiles\model\feedback_global_iteration_tg_beta.bat
call batchfiles\nan\nan_check.bat
call batchfiles\reports\report_rename_iteration_2.bat
REM
REM run feedback model iteration #2
call batchfiles\model\feedback_global_iteration_tg_beta.bat
call batchfiles\nan\nan_check.bat
call batchfiles\reports\report_rename_iteration_3.bat
REM
REM run feedback model iteration #3
call batchfiles\model\feedback_global_iteration_tg_beta.bat
call batchfiles\nan\nan_check.bat
call batchfiles\reports\report_rename_iteration_4.bat
REM
REM run global model iteration
call batchfiles\model\final_global_iteration_tg_beta.bat
call batchfiles\nan\nan_check.bat
call batchfiles\reports\report_rename_iteration_f.bat
REM
REM record model end time
if exist model_end_time.out erase model_end_time.out
echo full model end time: > model_end_time.out
time /t >> model_end_time.out