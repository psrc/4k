cd pm
REM record start of secondary call
echo "pm started at:" >> track3.rpt
time /t >> track3.rpt
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\9-9_calculate_drive_to_pnr_distribution_tables.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_construct_vehicle_trip_tables.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_vehicle_mode_choice_summary.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_vehicle_external_trip_summary.mac
REM record end of secondary call
echo "pm ended at:" >> track3.rpt
time /t >> track3.rpt
cd ..
REM create new indicator file and end
echo "pm finished at:" > donepm.ind
time /t >> donepm.ind
exit