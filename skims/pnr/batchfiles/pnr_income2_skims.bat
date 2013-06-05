cd Income2
REM record start of secondary call
echo "income 2 pnr skims started at:" >> track2.rpt
time /t >> track2.rpt
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_calculate_pnr_inc2_utilities.mac 3700 3733 3750 3751 4000
call emme -ng --set-iks 127.0.0.1 000 -m Macros\7_select_optimal_pnr_inc2_zones.mac 3700 3733 3750 3751 4000
call emme -ng --set-iks 127.0.0.1 000 -m Macros\8_calculate_pnr_inc2_skims.mac 3700 3733 3750 3751 4000
REM record end of secondary call
echo "income 2 pnr skims ended at:" >> track2.rpt
time /t >> track2.rpt
cd ..
REM create new indicator file and end
echo "income 2 pnr skims finished at:" > doneInc2_pnrskims.ind
time /t >> doneInc2_pnrskims.ind
exit