cd AM
REM record start of secondary call
echo "AM auto skims started at:" >> track1.rpt
time /t >> track1.rpt
REM call am auto skim macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\4_skim_am_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_calculate_am_auto_skims.mac
REM record end of secondary call
echo "AM auto skims ended at:" >> track1.rpt
time /t >> track1.rpt
cd ..
REM create new indicator file and end
echo "AM auto skims finished at:" > doneAM.ind
time /t >> doneAM.ind
exit