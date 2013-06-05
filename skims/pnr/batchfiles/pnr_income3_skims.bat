cd Income3
REM record start of secondary call
echo "income 3 pnr skims started at:" >> track3.rpt
time /t >> track3.rpt
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_calculate_pnr_inc3_utilities.mac 3700 3733 3750 3751 4000
call emme -ng --set-iks 127.0.0.1 000 -m Macros\7_select_optimal_pnr_inc3_zones.mac 3700 3733 3750 3751 4000
call emme -ng --set-iks 127.0.0.1 000 -m Macros\8_calculate_pnr_inc3_skims.mac 3700 3733 3750 3751 4000
REM record end of secondary call
echo "income 3 pnr skims ended at:" >> track3.rpt
time /t >> track3.rpt
cd ..
REM create new indicator file and end
echo "income 3 pnr skims finished at:" > doneInc3_pnrskims.ind
time /t >> doneInc3_pnrskims.ind
exit