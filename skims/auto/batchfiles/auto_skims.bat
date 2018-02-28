REM Puget Sound 4k: Trip Based Model
REM Created Novemeber 2017
REM File created by PSRC staff
REM Batch file to Skim Auto Network
REM Runs in Parallel but first copies files in series to avoid i/o conflicts

cd am
call emme -ng 000 -m ..\macros\1_initialize_matrices.mac a
call emme -ng 000 -m ..\macros\3_import_scenario.mac am 1002 %iternum%
call emme -ng 000 -m ..\macros\4_import_iz_tt_matrices.mac

cd ..
cd md
call emme -ng 000 -m ..\macros\1_initialize_matrices.mac m
call emme -ng 000 -m ..\macros\3_import_scenario.mac md 1004 %iternum%
call emme -ng 000 -m ..\macros\4_import_iz_tt_matrices.mac

cd ..
cd pm
call emme -ng 000 -m ..\macros\1_initialize_matrices.mac p
call emme -ng 000 -m ..\macros\3_import_scenario.mac pm 1003 %iternum%
call emme -ng 000 -m ..\macros\4_import_iz_tt_matrices.mac

cd ..
cd ev
call emme -ng 000 -m ..\macros\1_initialize_matrices.mac e
call emme -ng 000 -m ..\macros\3_import_scenario.mac ev 1005 %iternum%
call emme -ng 000 -m ..\macros\4_import_iz_tt_matrices.mac

cd ..
cd ni
call emme -ng 000 -m ..\macros\1_initialize_matrices.mac n
call emme -ng 000 -m ..\macros\3_import_scenario.mac ni 1006 %iternum%
call emme -ng 000 -m ..\macros\4_import_iz_tt_matrices.mac

cd ..
if exist *.ind erase *.ind
start batchfiles\am_auto_skims.bat
start batchfiles\md_auto_skims.bat
start batchfiles\pm_auto_skims.bat
start batchfiles\ev_auto_skims.bat
start batchfiles\ni_auto_skims.bat
