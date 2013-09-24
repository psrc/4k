cd income2
REM record start of secondary call
echo "income 2 pnr skims started at:" >> track2.rpt
time /t >> track2.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_calculate_pnr_inc2_utilities.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_select_optimal_pnr_inc2_zones.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_pnr_inc2_skims.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
REM record end of secondary call
echo "income 2 pnr skims ended at:" >> track2.rpt
time /t >> track2.rpt
cd ..
REM create new indicator file and end
echo "income 2 pnr skims finished at:" > doneinc2_pnrskims.ind
time /t >> doneinc2_pnrskims.ind
exit