cd md
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
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_import_distribution_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_import_mode_share_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_import_tod_share_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\9-1_import_pnr_trip_tables.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\9-8_import_optimal_pnr_lots.mac
cd..