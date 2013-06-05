cd AM
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM record start of secondary call
echo "AM auto skims started at:" >> track1.rpt
time /t >> track1.rpt
REM call am auto skim macros
REM call emme -ng --set-iks 127.0.0.1 000 -m Macros\1_initialize_am_matrices.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m Macros\2_initialize_am_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2-9_copy_previous_am_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3_import_am_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\4_skim_am_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\5_import_iz_tt_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_calculate_am_auto_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\7_calculate_am_auto_feedback_skims.mac
REM record end of secondary call
echo "AM auto skims ended at:" >> track1.rpt
time /t >> track1.rpt
cd ..
REM create new indicator file and end
echo "AM auto skims finished at:" > doneAM.ind
time /t >> doneAM.ind
exit