cd am\all_mode
if exist *.rpt erase *.rpt
REM call am transit skim macros
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\1_initialize_am_matrices.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_am_origin_matrices.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_am_destination_matrices.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_am_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4-9_copy_previous_am_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_import_am_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_import_am_matrices.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_calculate_am_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7-9_calculate_am_transit_feedback_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_am_fares.mac %highpnr%
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\9_export_files_for_urbansim.mac
cd ..\..