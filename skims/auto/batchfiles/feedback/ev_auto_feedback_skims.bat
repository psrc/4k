cd ev
if exist *.rpt erase *.rpt
REM record start of secondary call
echo "ev auto skims started at:" >> track4.rpt
time /t >> track4.rpt
REM call ev auto skim macros
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\1_initialize_ev_matrices.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_ev_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2-9_copy_previous_ev_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_import_ev_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_skim_ev_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_import_iz_tt_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_calculate_ev_auto_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_calculate_ev_auto_feedback_skims.mac
REM record end of secondary call
echo "ev auto skims ended at:" >> track4.rpt
time /t >> track4.rpt
cd ..
REM create new indicator file and end
echo "ev auto skims finished at:" > doneev.ind
time /t >> doneev.ind
exit