cd am\all_mode
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_initialize_am_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_am_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_am_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_am_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_import_am_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_import_am_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_calculate_am_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_am_fares.mac
cd ..\..