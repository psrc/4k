cd ni
REM record start of secondary call
echo "ni auto skims started at:" >> track5.rpt
time /t >> track5.rpt
REM call ni auto skim macros
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_skim_ni_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_calculate_ni_auto_skims.mac
REM record end of secondary call
echo "ni auto skims ended at:" >> track5.rpt
time /t >> track5.rpt
cd ..
REM create new indicator file and end
echo "ni auto skims finished at:" > doneni.ind
time /t >> doneni.ind
exit