cd NI
REM record start of secondary call
echo "NI auto skims started at:" >> track5.rpt
time /t >> track5.rpt
REM call ni auto skim macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\4_skim_ni_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_calculate_ni_auto_skims.mac
REM record end of secondary call
echo "NI auto skims ended at:" >> track5.rpt
time /t >> track5.rpt
cd ..
REM create new indicator file and end
echo "NI auto skims finished at:" > doneNI.ind
time /t >> doneNI.ind
exit