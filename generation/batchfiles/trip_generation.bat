cd trip
if exist *.rpt erase *.rpt
REM call trip generation macros
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\1-9_initialize_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_initialize_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_input_data.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_input_rates.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_crossclasses.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_apply_triprates.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_copy_attractions.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_copy_productions.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_tripgen_summary_1.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\12-1_tripgen_county_summary_1.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\12-2_tripgen_subregion_summary_1.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\12-9_input_external_trips.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\13_balance_trips.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\14_tripgen_summary_2.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\14-1_tripgen_county_summary_2.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\14-2_tripgen_subregion_summary_2.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\15_tripgen_summary_3.mac
cd ..
