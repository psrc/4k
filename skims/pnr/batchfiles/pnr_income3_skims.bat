cd income3

call emme -ng 000 -m ..\macros\2_calculate_pnr_utilities.mac 3 %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m ..\macros\3_select_optimal_pnr_zones.mac 3 %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m ..\macros\4_calculate_pnr_skims.mac 3 %highstation%

cd ..
echo "income 3 pnr skims finished" > doneInc3_pnrskims.ind
exit