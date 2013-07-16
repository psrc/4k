cd income4
REM record start of secondary call
echo "income4 started at:" >> track4.rpt
time /t >> track4.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_import_pnr_skim_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_import_distribution_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_import_mode_share_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_calculate_pnr_trip_tables.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_copy_trip_tables.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
REM record end of secondary call
echo "income4 ended at:" >> track4.rpt
time /t >> track4.rpt
cd ..
REM create new indicator file and end
echo "income4 finished at:" > doneincome4.ind
time /t >> doneincome4.ind
exit