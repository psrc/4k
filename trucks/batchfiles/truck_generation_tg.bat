cd generation
if exist *.rpt erase *.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_initialize_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_initialize_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_input_data.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_import_matrices_tg.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_total_households.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_copy_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_calculate_truck_employment.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_calculate_truck_productions.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\13_calculate_truck_attractions.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\14_transpose_attractions.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\15_add_special_generators.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\16_refactor_productions_attractions.mac
cd ..
