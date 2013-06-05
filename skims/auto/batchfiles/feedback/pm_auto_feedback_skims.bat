cd PM
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM record start of secondary call
echo "PM auto skims started at:" >> track3.rpt
time /t >> track3.rpt
REM call pm auto skim macros
REM call emme -ng --set-iks 127.0.0.1 000 -m Macros\1_initialize_pm_matrices.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m Macros\2_initialize_pm_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2-9_copy_previous_pm_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3_import_pm_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\4_skim_pm_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\5_import_iz_tt_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_calculate_pm_auto_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\7_calculate_pm_auto_feedback_skims.mac
REM record end of secondary call
echo "PM auto skims ended at:" >> track3.rpt
time /t >> track3.rpt
cd ..
REM create new indicator file and end
echo "PM auto skims finished at:" > donePM.ind
time /t >> donePM.ind
exit