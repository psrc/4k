cd pm
call emme -ng --set-iks 127.0.0.1 000 -m macros\2-9_copy_previous_pm_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_import_pm_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_skim_pm_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_calculate_pm_auto_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_calculate_pm_auto_feedback_skims.mac
cd ..
echo "pm auto skims finished" > donepm.ind
exit