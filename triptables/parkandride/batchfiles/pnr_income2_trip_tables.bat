cd income2
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_calculate_pnr_trip_tables.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_copy_trip_tables.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
cd ..
echo "income2 finished" > doneincome2.ind
exit