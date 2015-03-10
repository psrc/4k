cd ev
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_skim_ev_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_calculate_ev_auto_skims.mac
cd ..
echo "ev auto skims finished" > doneev.ind
exit