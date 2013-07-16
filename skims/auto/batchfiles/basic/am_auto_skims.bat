cd am
REM record start of secondary call
echo "am auto skims started at:" >> track1.rpt
time /t >> track1.rpt
REM call am auto skim macros
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_skim_am_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_calculate_am_auto_skims.mac
REM record end of secondary call
echo "am auto skims ended at:" >> track1.rpt
time /t >> track1.rpt
cd ..
REM create new indicator file and end
echo "am auto skims finished at:" > doneam.ind
time /t >> doneam.ind
exit