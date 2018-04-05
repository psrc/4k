cd ev\all_mode
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_initialize_ev_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_ev_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_ev_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_ev_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_import_ev_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_import_ev_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_calculate_ev_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_ev_fares.mac
cd ..\..