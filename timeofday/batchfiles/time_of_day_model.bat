REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM File created by PSRC staff
REM Batch file to run Logit Based Time of Day Model
REM Delays are based on changes from the Overnight Period

REM calculate delay matrices
cd delay
call ..\batchfiles\delay.bat
cd ..

if exist *.ind erase *.ind

REM Run Time of Day Models in Parallel
start batchfiles\tod_sov.bat
start batchfiles\tod_hov.bat
