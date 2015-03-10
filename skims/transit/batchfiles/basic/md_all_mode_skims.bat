cd md\all_mode
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_initialize_md_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_md_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_md_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_md_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_import_md_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_import_md_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_calculate_md_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_md_fares.mac
cd ..\..