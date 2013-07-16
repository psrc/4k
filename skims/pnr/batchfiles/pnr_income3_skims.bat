cd income3
REM record start of secondary call
echo "income 3 pnr skims started at:" >> track3.rpt
time /t >> track3.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_calculate_pnr_inc3_utilities.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_select_optimal_pnr_inc3_zones.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_pnr_inc3_skims.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
REM record end of secondary call
echo "income 3 pnr skims ended at:" >> track3.rpt
time /t >> track3.rpt
cd ..
REM create new indicator file and end
echo "income 3 pnr skims finished at:" > doneinc3_pnrskims.ind
time /t >> doneinc3_pnrskims.ind
exit