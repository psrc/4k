cd income2
REM record start of secondary call
echo "Income2 started at:" >> track2.rpt
time /t >> track2.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_import_pnr_skim_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_import_distribution_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_import_mode_share_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_calculate_pnr_trip_tables.mac 3700 3701 3750 3751 4000
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_copy_trip_tables.mac 3700 3701 3750 3751 4000
REM record end of secondary call
echo "Income2 ended at:" >> track2.rpt
time /t >> track2.rpt
cd ..
REM create new indicator file and end
echo "Income2 finished at:" > doneIncome2.ind
time /t >> doneIncome2.ind
exit