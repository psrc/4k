cd ev
REM record start of secondary call
echo "ev auto skims started at:" >> track4.rpt
time /t >> track4.rpt
REM call ev auto skim macros
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_skim_ev_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_calculate_ev_auto_skims.mac
REM record end of secondary call
echo "ev auto skims ended at:" >> track4.rpt
time /t >> track4.rpt
cd ..
REM create new indicator file and end
echo "ev auto skims finished at:" > doneev.ind
time /t >> doneev.ind
exit