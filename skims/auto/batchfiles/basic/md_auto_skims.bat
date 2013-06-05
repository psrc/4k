cd MD
REM record start of secondary call
echo "MD auto skims started at:" >> track2.rpt
time /t >> track2.rpt
REM call md auto skim macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\4_skim_md_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_calculate_md_auto_skims.mac
REM record end of secondary call
echo "MD auto skims ended at:" >> track2.rpt
time /t >> track2.rpt
cd ..
REM create new indicator file and end
echo "MD auto skims finished at:" > doneMD.ind
time /t >> doneMD.ind
exit