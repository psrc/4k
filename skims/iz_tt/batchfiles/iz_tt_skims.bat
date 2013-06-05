REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM call intrazonal skim and terminal time macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2_initialize_iz_tt_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3_initialize_iz_tt_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\4_initialize_iz_tt_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\5_initialize_iz_tt_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_input_matrix_data.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\7_calculate_terminal_time.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\8_calculate_intrazonal_skims.mac