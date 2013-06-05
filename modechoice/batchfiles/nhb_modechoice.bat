cd nhb
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_initialize_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_initialize_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_input_data.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_import_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_auto_cost_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_calculate_drive_alone_utility.mac 3700 3701 3750 3751 4000
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_calculate_shared_ride_2_utility.mac 3700 3701 3750 3751 4000
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_calculate_shared_ride_3+_utility.mac 3700 3701 3750 3751 4000
call emme -ng --set-iks 127.0.0.1 000 -m macros\13_calculate_transit_walk_access_utility.mac 3700 3701 3750 3751 4000
call emme -ng --set-iks 127.0.0.1 000 -m macros\14_calculate_bike_utility.mac 3700 3701 3750 3751 4000
call emme -ng --set-iks 127.0.0.1 000 -m macros\15_calculate_walk_utility.mac 3700 3701 3750 3751 4000
call emme -ng --set-iks 127.0.0.1 000 -m macros\16_calculate_mode_shares.mac 3700 3701 3750 3751 4000
call emme -ng --set-iks 127.0.0.1 000 -m macros\17_report_mode_shares.mac 3700 3701 3750 3751 4000
cd ..