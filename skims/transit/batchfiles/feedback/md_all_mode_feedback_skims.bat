cd md\all_mode
if exist *.rpt erase *.rpt
REM call md transit skim macros
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\1_initialize_md_matrices.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_md_origin_matrices.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_md_destination_matrices.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_md_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4-9_copy_previous_md_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_import_md_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_import_md_matrices.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_calculate_md_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7-9_calculate_md_transit_feedback_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_md_fares.mac %highpnr%
cd ..\..