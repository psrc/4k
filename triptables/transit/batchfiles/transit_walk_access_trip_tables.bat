REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM File created by PSRC staff
REM Batch file to create the Transit Trip Tables by Time of Day
REM Trip Tables are created using fixed time of day factors

cd walkaccess
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_initialize_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_initialize_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_import_distribution_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_import_mode_share_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8-1_import_pnr_trip_tables.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_construct_am_transit_walk_access_trip_tables.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_construct_md_transit_walk_access_trip_tables.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_construct_pm_transit_walk_access_trip_tables.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_construct_ev_transit_walk_access_trip_tables.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\13_construct_ni_transit_walk_access_trip_tables.mac
cd..
