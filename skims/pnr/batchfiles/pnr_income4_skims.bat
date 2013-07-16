cd income4
REM record start of secondary call
echo "income 4 pnr skims started at:" >> track4.rpt
time /t >> track4.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_calculate_pnr_inc4_utilities.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_select_optimal_pnr_inc4_zones.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_pnr_inc4_skims.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
REM record end of secondary call
echo "income 4 pnr skims ended at:" >> track4.rpt
time /t >> track4.rpt
cd ..
REM create new indicator file and end
echo "income 4 pnr skims finished at:" > doneinc4_pnrskims.ind
time /t >> doneinc4_pnrskims.ind
exit