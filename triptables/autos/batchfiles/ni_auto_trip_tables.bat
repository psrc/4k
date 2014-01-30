cd ni
REM record start of secondary call
echo "ni started at:" >> track5.rpt
time /t >> track5.rpt
REm call emme -ng --set-iks 127.0.0.1 000 -m macros\9-9_calculate_drive_to_pnr_distribution_tables.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_construct_vehicle_trip_tables.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_vehicle_mode_choice_summary.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_vehicle_external_trip_summary.mac
REM record end of secondary call
echo "ni ended at:" >> track5.rpt
time /t >> track5.rpt
cd ..
REM create new indicator file and end
echo "ni finished at:" > doneni.ind
time /t >> doneni.ind
exit