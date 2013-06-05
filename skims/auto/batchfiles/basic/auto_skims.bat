cd AM
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM call am auto skim macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\1_initialize_am_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2_initialize_am_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3_import_am_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3-9_import_iz_tt_matrices.mac
cd ..
cd MD
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM call md auto skim macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\1_initialize_md_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2_initialize_md_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3_import_md_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3-9_import_iz_tt_matrices.mac
cd ..
cd PM
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM call pm auto skim macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\1_initialize_pm_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2_initialize_pm_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3_import_pm_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3-9_import_iz_tt_matrices.mac
cd ..
cd EV
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM call ev auto skim macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\1_initialize_ev_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2_initialize_ev_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3_import_ev_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3-9_import_iz_tt_matrices.mac
cd ..
cd NI
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM call ni auto skim macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\1_initialize_ni_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2_initialize_ni_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3_import_ni_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3-9_import_iz_tt_matrices.mac
cd ..
REM erase all existing indicator (.ind) files
if exist *.ind erase *.ind
REM begin auto skims
REM start AM auto skims
start batchfiles\basic\am_auto_skims.bat
REM start MD auto skims
start batchfiles\basic\md_auto_skims.bat
REM start PM auto skims
start batchfiles\basic\pm_auto_skims.bat
REM start EV auto skims
start batchfiles\basic\ev_auto_skims.bat
REM start NI auto skims
start batchfiles\basic\ni_auto_skims.bat
