cd income3
REM record start of secondary call
echo "income3 started at:" >> track3.rpt
time /t >> track3.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_import_pnr_skim_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_import_distribution_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_import_mode_share_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_calculate_pnr_trip_tables.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_copy_trip_tables.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
REM record end of secondary call
echo "income3 ended at:" >> track3.rpt
time /t >> track3.rpt
cd ..
REM create new indicator file and end
echo "income3 finished at:" > doneincome3.ind
time /t >> doneincome3.ind
exit