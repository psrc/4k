cd am
if exist *.rpt erase *.rpt
REM record start of secondary call
echo "am auto skims started at:" >> track1.rpt
time /t >> track1.rpt
REM call am auto skim macros
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\1_initialize_am_matrices.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_am_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2-9_copy_previous_am_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_import_am_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_skim_am_network.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\5_import_iz_tt_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_calculate_am_auto_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_calculate_am_auto_feedback_skims.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\8_export_files_for_urbansim.mac
REM record end of secondary call
echo "am auto skims ended at:" >> track1.rpt
time /t >> track1.rpt
cd ..
REM create new indicator file and end
echo "am auto skims finished at:" > doneam.ind
time /t >> doneam.ind
exit