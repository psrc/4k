cd pm\all_mode
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_initialize_pm_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_pm_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_pm_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_pm_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_import_pm_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_import_pm_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_calculate_pm_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_pm_fares.mac
cd ..\..