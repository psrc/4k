REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM File created by PSRC staff
REM Batch file to SKim Auto Network
REM Runs in Parallel
cd am
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_initialize_am_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_am_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_import_am_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3-9_import_iz_tt_matrices.mac
cd ..
cd md
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_initialize_md_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_md_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_import_md_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3-9_import_iz_tt_matrices.mac
cd ..
cd pm
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_initialize_pm_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_pm_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_import_pm_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3-9_import_iz_tt_matrices.mac
cd ..
cd ev
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_initialize_ev_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_ev_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_import_ev_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3-9_import_iz_tt_matrices.mac
cd ..
cd ni
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_initialize_ni_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_ni_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_import_ni_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3-9_import_iz_tt_matrices.mac
cd ..
if exist *.ind erase *.ind
start batchfiles\basic\am_auto_skims.bat
start batchfiles\basic\md_auto_skims.bat
start batchfiles\basic\pm_auto_skims.bat
start batchfiles\basic\ev_auto_skims.bat
start batchfiles\basic\ni_auto_skims.bat
