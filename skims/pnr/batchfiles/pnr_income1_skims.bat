cd income1
REM record start of secondary call
echo "income 1 pnr skims started at:" >> track1.rpt
time /t >> track1.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_calculate_pnr_inc1_utilities.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_select_optimal_pnr_inc1_zones.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_pnr_inc1_skims.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
REM record end of secondary call
echo "income 1 pnr skims ended at:" >> track1.rpt
time /t >> track1.rpt
cd ..
REM create new indicator file and end
echo "income 1 pnr skims finished at:" > doneinc1_pnrskims.ind
time /t >> doneinc1_pnrskims.ind
exit