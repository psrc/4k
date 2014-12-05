REM highest internal taz number
set hightaz=3700
REM lowest external station number
set lowstation=3733
REM highest external station number
set highstation=3750
REM low end of pnr zone range
set lowpnr=3751
REM high end of pnr zone range
set highpnr=4000
REM run all mode choice models
REM home-based college mode choice
call batchfiles\hb_college_modechoice.bat
REM home-based non-work mode choice
call batchfiles\hb_non_work_modechoice.bat
REM home-based school mode choice
call batchfiles\hb_school_modechoice.bat
REM home-based work (income 1) mode choice
call batchfiles\hb_work_inc1_modechoice.bat
REM home-based work (income 2) mode choice
call batchfiles\hb_work_inc2_modechoice.bat
REM home-based work (income 3) mode choice
call batchfiles\hb_work_inc3_modechoice.bat
REM home-based work (income 4) mode choice
call batchfiles\hb_work_inc4_modechoice.bat
REM non-home-based mode choice
call batchfiles\nhb_modechoice.bat