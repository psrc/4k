cd ni
REM record start of secondary call
echo "NI started at:" >> track5.rpt
time /t >> track5.rpt
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\9-9_calculate_drive_to_pnr_distribution_tables.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_construct_vehicle_trip_tables.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_vehicle_mode_choice_summary.mac 3700 3701 3750 3751 4000
REM record end of secondary call
echo "NI ended at:" >> track5.rpt
time /t >> track5.rpt
cd ..
REM create new indicator file and end
echo "NI finished at:" > doneNI.ind
time /t >> doneNI.ind
exit

