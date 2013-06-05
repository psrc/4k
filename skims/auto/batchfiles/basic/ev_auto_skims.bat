cd EV
REM record start of secondary call
echo "EV auto skims started at:" >> track4.rpt
time /t >> track4.rpt
REM call ev auto skim macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\4_skim_ev_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_calculate_ev_auto_skims.mac
REM record end of secondary call
echo "EV auto skims ended at:" >> track4.rpt
time /t >> track4.rpt
cd ..
REM create new indicator file and end
echo "EV auto skims finished at:" > doneEV.ind
time /t >> doneEV.ind
exit