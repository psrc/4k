cd pm
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_skim_pm_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_calculate_pm_auto_skims.mac
cd ..
echo "pm auto skims finished:" > donepm.ind
exit