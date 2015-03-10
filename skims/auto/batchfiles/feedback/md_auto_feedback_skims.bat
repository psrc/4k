cd md
call emme -ng --set-iks 127.0.0.1 000 -m macros\2-9_copy_previous_md_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_import_md_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_skim_md_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_calculate_md_auto_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_calculate_md_auto_feedback_skims.mac
cd ..
echo "md auto skims finished" > donemd.ind
exit