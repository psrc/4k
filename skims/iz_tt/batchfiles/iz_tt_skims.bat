if exist *.rpt erase *.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_iz_tt_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_iz_tt_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_iz_tt_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_initialize_iz_tt_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_input_matrix_data.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_calculate_terminal_time.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_intrazonal_skims.mac