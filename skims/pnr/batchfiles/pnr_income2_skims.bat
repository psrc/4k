cd income2

call emme -ng 000 -m ..\macros\2_calculate_pnr_utilities.mac 2 %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m ..\macros\3_select_optimal_pnr_zones.mac 2 %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m ..\macros\4_calculate_pnr_skims.mac 2 %highstation%

cd ..
echo "income 2 pnr skims finished" > doneInc2_pnrskims.ind
exit