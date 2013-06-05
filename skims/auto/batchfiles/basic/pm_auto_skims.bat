cd PM
REM record start of secondary call
echo "PM auto skims started at:" >> track3.rpt
time /t >> track3.rpt
REM call pm auto skim macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\4_skim_pm_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_calculate_pm_auto_skims.mac
REM record end of secondary call
echo "PM auto skims ended at:" >> track3.rpt
time /t >> track3.rpt
cd ..
REM create new indicator file and end
echo "PM auto skims finished at:" > donePM.ind
time /t >> donePM.ind
exit