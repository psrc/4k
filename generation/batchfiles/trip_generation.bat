cd trip
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM call trip generation macros
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\1-9_initialize_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_initialize_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_input_data.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_input_rates.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_crossclasses.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_apply_triprates.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_copy_attractions.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_copy_productions.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_tripgen_summary_1.mac 3700 3701 3750 3751 4000
call emme -ng --set-iks 127.0.0.1 000 -m macros\12-9_input_external_trips.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\13_balance_trips.mac 3700 3701 3750 3751 4000
call emme -ng --set-iks 127.0.0.1 000 -m macros\14_tripgen_summary_2.mac 3700 3701 3750 3751 4000
call emme -ng --set-iks 127.0.0.1 000 -m macros\15_tripgen_summary_3.mac
cd ..
