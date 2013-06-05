cd income1
REM record start of secondary call
echo "Income1 started at:" >> track1.rpt
time /t >> track1.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_import_pnr_skim_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_import_distribution_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_import_mode_share_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_calculate_pnr_trip_tables.mac 3700 3701 3750 3751 4000
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_copy_trip_tables.mac 3700 3701 3750 3751 4000
REM record end of secondary call
echo "Income1 ended at:" >> track1.rpt
time /t >> track1.rpt
cd ..
REM create new indicator file and end
echo "Income1 finished at:" > doneIncome1.ind
time /t >> doneIncome1.ind
exit