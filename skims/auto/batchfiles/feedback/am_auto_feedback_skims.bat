cd am
call emme -ng --set-iks 127.0.0.1 000 -m macros\2-9_copy_previous_am_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_import_am_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_skim_am_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_calculate_am_auto_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_calculate_am_auto_feedback_skims.mac
cd ..
echo "am auto skims finished" > doneam.ind
exit