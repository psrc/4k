REM delete existing *.rpt, errors, and reports files
if exist *.txt erase *.txt
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_initialize_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_initialize_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_import_skim_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7-8_subtract_terminal_times.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7-9_zero_disconnected_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_input_data.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_auto_cost_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_export_nhb_mc_auto_time_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_export_nhb_mc_auto_cost_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_export_nhb_mc_transit_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\13_export_nhb_mc_nonmotorized_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\14_export_hnw_mc_auto_time_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\15_export_hnw_mc_auto_cost_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\16_export_hnw_mc_transit_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\17_export_hnw_mc_nonmotorized_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\18_export_sch_mc_auto_time_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\19_export_sch_mc_auto_cost_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\20_export_sch_mc_transit_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\21_export_sch_mc_nonmotorized_skims.mac