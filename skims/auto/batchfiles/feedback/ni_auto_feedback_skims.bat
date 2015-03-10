cd ni
call emme -ng --set-iks 127.0.0.1 000 -m macros\2-9_copy_previous_ni_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_import_ni_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_skim_ni_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_calculate_ni_auto_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_calculate_ni_auto_feedback_skims.mac
cd ..
echo "ni auto skims finished" > doneni.ind
exit