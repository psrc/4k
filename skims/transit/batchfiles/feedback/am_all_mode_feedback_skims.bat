cd am\all_mode
call emme -ng --set-iks 127.0.0.1 000 -m macros\4-9_copy_previous_am_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_import_am_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_import_am_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_calculate_am_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7-9_calculate_am_transit_feedback_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_am_fares.mac
cd ..\..