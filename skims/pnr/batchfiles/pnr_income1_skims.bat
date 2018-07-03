cd income1

call emme -ng 000 -m ..\macros\2_calculate_pnr_utilities.mac 1 %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m ..\macros\3_select_optimal_pnr_zones.mac 1 %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m ..\macros\4_calculate_pnr_skims.mac 1 %highstation%

cd ..
echo "income 1 pnr skims finished" > doneInc1_pnrskims.ind
exit