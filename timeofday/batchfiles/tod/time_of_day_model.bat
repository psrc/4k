if exist tod_start.out erase tod_start.out
time /t >> tod_start.out
REM calculate delay matrices
cd delay
call ..\batchfiles\delay\delay.bat
cd ..
REM setup time of day models
REM hb other
cd hbother
call ..\batchfiles\setup\hbother_tod_setup.bat
cd ..
REM hb shop
cd hbshop
call ..\batchfiles\setup\hbshop_tod_setup.bat
cd ..
REM hb work - hov
cd hbwork
call ..\batchfiles\setup\hbwork_tod_hov_setup.bat
REM hb work - sov - income 1
call ..\batchfiles\setup\hbwork_tod_sov_inc1_setup.bat
REM hb work - sov - income 2
call ..\batchfiles\setup\hbwork_tod_sov_inc2_setup.bat
REM hb work - sov - income 3
call ..\batchfiles\setup\hbwork_tod_sov_inc3_setup.bat
REM hb work - sov - income 4
call ..\batchfiles\setup\hbwork_tod_sov_inc4_setup.bat
cd ..
REM erase all existing indicator (.ind) files
if exist *.ind erase *.ind
REM begin time of day model
REM start hb other
start batchfiles\tod\hbother_tod.bat
REM start hb shop
start batchfiles\tod\hbshop_tod.bat
REM start hb work - hov
start batchfiles\tod\hbwork_tod_hov.bat
REM start hb work - sov - income 1
start batchfiles\tod\hbwork_tod_sov_inc1.bat
REM start hb work - sov - income 2
start batchfiles\tod\hbwork_tod_sov_inc2.bat
REM start hb work - sov - income 3
start batchfiles\tod\hbwork_tod_sov_inc3.bat
REM start hb work - sov - income 4
start batchfiles\tod\hbwork_tod_sov_inc4.bat
