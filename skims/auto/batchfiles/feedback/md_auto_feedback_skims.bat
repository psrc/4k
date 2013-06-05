cd MD
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM record start of secondary call
echo "MD auto skims started at:" >> track2.rpt
time /t >> track2.rpt
REM call md auto skim macros
REM call emme -ng --set-iks 127.0.0.1 000 -m Macros\1_initialize_md_matrices.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m Macros\2_initialize_md_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2-9_copy_previous_md_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3_import_md_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\4_skim_md_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\5_import_iz_tt_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_calculate_md_auto_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\7_calculate_md_auto_feedback_skims.mac
REM record end of secondary call
echo "MD auto skims ended at:" >> track2.rpt
time /t >> track2.rpt
cd ..
REM create new indicator file and end
echo "MD auto skims finished at:" > doneMD.ind
time /t >> doneMD.ind
exit