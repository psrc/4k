cd Income1
REM record start of secondary call
echo "income 1 pnr skims started at:" >> track1.rpt
time /t >> track1.rpt
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_calculate_pnr_inc1_utilities.mac 3700 3733 3750 3751 4000
call emme -ng --set-iks 127.0.0.1 000 -m Macros\7_select_optimal_pnr_inc1_zones.mac 3700 3733 3750 3751 4000
call emme -ng --set-iks 127.0.0.1 000 -m Macros\8_calculate_pnr_inc1_skims.mac 3700 3733 3750 3751 4000
REM record end of secondary call
echo "income 1 pnr skims ended at:" >> track1.rpt
time /t >> track1.rpt
cd ..
REM create new indicator file and end
echo "income 1 pnr skims finished at:" > doneInc1_pnrskims.ind
time /t >> doneInc1_pnrskims.ind
exit