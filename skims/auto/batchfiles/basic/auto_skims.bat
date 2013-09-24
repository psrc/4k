cd am
if exist *.rpt erase *.rpt
REM call am auto skim macros
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_initialize_am_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_am_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_import_am_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3-9_import_iz_tt_matrices.mac
cd ..
cd md
if exist *.rpt erase *.rpt
REM call md auto skim macros
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_initialize_md_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_md_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_import_md_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3-9_import_iz_tt_matrices.mac
cd ..
cd pm
if exist *.rpt erase *.rpt
REM call pm auto skim macros
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_initialize_pm_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_pm_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_import_pm_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3-9_import_iz_tt_matrices.mac
cd ..
cd ev
if exist *.rpt erase *.rpt
REM call ev auto skim macros
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_initialize_ev_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_ev_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_import_ev_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3-9_import_iz_tt_matrices.mac
cd ..
cd ni
if exist *.rpt erase *.rpt
REM call ni auto skim macros
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_initialize_ni_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_ni_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_import_ni_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3-9_import_iz_tt_matrices.mac
cd ..
REM erase all existing indicator (.ind) files
if exist *.ind erase *.ind
REM begin auto skims
REM start am auto skims
start batchfiles\basic\am_auto_skims.bat
REM start md auto skims
start batchfiles\basic\md_auto_skims.bat
REM start pm auto skims
start batchfiles\basic\pm_auto_skims.bat
REM start ev auto skims
start batchfiles\basic\ev_auto_skims.bat
REM start ni auto skims
start batchfiles\basic\ni_auto_skims.bat
