cd income2
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_calculate_pnr_inc2_utilities.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_select_optimal_pnr_inc2_zones.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_pnr_inc2_skims.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
cd ..
echo "income 2 pnr skims finished" > doneinc2_pnrskims.ind
exit