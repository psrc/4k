cd income3
REM record start of secondary call
echo "Income3 started at:" >> track3.rpt
time /t >> track3.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_import_pnr_skim_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_import_distribution_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_import_mode_share_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_calculate_pnr_trip_tables.mac 3700 3701 3750 3751 4000
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_copy_trip_tables.mac 3700 3701 3750 3751 4000
REM record end of secondary call
echo "Income3 ended at:" >> track3.rpt
time /t >> track3.rpt
cd ..
REM create new indicator file and end
echo "Income3 finished at:" > doneIncome3.ind
time /t >> doneIncome3.ind
exit