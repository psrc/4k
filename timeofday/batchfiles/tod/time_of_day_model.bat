REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM File created by PSRC staff
REM Batch file to run Logit Based Time of Day Model
REM Delays are based on changes from the Overnight Period

REM calculate delay matrices
cd delay
call ..\batchfiles\delay\delay.bat
cd ..

REM Set-up time of day models
call batchfiles\setup\hbother_tod_setup.bat
call batchfiles\setup\hbshop_tod_setup.bat
call batchfiles\setup\hbwork_tod_hov_setup.bat
call batchfiles\setup\hbwork_tod_sov_inc1_setup.bat
call batchfiles\setup\hbwork_tod_sov_inc2_setup.bat
call batchfiles\setup\hbwork_tod_sov_inc3_setup.bat
call batchfiles\setup\hbwork_tod_sov_inc4_setup.bat

if exist *.ind erase *.ind
REM Run Time of Day Models in Parallel
start batchfiles\tod\hbother_tod.bat
start batchfiles\tod\hbshop_tod.bat
start batchfiles\tod\hbwork_tod_hov.bat
start batchfiles\tod\hbwork_tod_sov_inc1.bat
start batchfiles\tod\hbwork_tod_sov_inc2.bat
start batchfiles\tod\hbwork_tod_sov_inc3.bat
start batchfiles\tod\hbwork_tod_sov_inc4.bat
