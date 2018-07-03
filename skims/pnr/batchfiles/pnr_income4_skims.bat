cd income4

call emme -ng 000 -m ..\macros\2_calculate_pnr_utilities.mac 4 %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m ..\macros\3_select_optimal_pnr_zones.mac 4 %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m ..\macros\4_calculate_pnr_skims.mac 4 %highstation%

cd ..
echo "income 4 pnr skims finished" > doneInc4_pnrskims.ind
exit