cd pm
if exist *.rpt erase *.rpt
REM record start of secondary call
echo "pm auto skims started at:" >> track3.rpt
time /t >> track3.rpt
REM call pm auto skim macros
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\1_initialize_pm_matrices.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_pm_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2-9_copy_previous_pm_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_import_pm_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_skim_pm_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_import_iz_tt_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_calculate_pm_auto_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_calculate_pm_auto_feedback_skims.mac
REM record end of secondary call
echo "pm auto skims ended at:" >> track3.rpt
time /t >> track3.rpt
cd ..
REM create new indicator file and end
echo "pm auto skims finished at:" > donepm.ind
time /t >> donepm.ind
exit