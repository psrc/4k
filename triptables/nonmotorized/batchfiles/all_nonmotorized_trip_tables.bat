cd all
if exist *.rpt erase *.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_initialize_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_initialize_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_import_distribution_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_import_mode_share_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_construct_am_nonmotorized_trip_tables.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\9-1_nonmotorized_mode_choice_summary.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_construct_md_nonmotorized_trip_tables.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\10-1_nonmotorized_mode_choice_summary.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_construct_pm_nonmotorized_trip_tables.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\11-1_nonmotorized_mode_choice_summary.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_construct_ev_nonmotorized_trip_tables.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\12-1_nonmotorized_mode_choice_summary.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\13_construct_ni_nonmotorized_trip_tables.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\13-1_nonmotorized_mode_choice_summary.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\14_export_files_for_urbansim.mac
cd..
