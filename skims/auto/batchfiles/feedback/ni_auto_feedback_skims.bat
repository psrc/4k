cd NI
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM record start of secondary call
echo "NI auto skims started at:" >> track5.rpt
time /t >> track5.rpt
REM call ni auto skim macros
REM call emme -ng --set-iks 127.0.0.1 000 -m Macros\1_initialize_ni_matrices.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m Macros\2_initialize_ni_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2-9_copy_previous_ni_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3_import_ni_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\4_skim_ni_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\5_import_iz_tt_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_calculate_ni_auto_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\7_calculate_ni_auto_feedback_skims.mac
REM record end of secondary call
echo "NI auto skims ended at:" >> track5.rpt
time /t >> track5.rpt
cd ..
REM create new indicator file and end
echo "NI auto skims finished at:" > doneNI.ind
time /t >> doneNI.ind
exit