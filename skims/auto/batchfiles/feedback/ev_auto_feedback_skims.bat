cd ev
call emme -ng --set-iks 127.0.0.1 000 -m macros\2-9_copy_previous_ev_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_import_ev_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_skim_ev_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_calculate_ev_auto_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_calculate_ev_auto_feedback_skims.mac
cd ..
echo "ev auto skims finished" > doneev.ind
exit