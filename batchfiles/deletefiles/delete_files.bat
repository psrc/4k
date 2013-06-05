REM call from root folder (e.g., PSRC_TDModel_1200/2006)
REM deletes matrix, report, indicator files from most folders
REM useful for prepping a completed model run for compression and archiving
call batchfiles/deletefiles/delete_matrix_files.bat
call batchfiles/deletefiles/delete_report_files.bat
call batchfiles/deletefiles/delete_indicator_files.bat