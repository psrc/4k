cd hbwork_inc1
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_initialize_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_initialize_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_import_matrices_ag.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_friction_factors.mac 938 939 956 1001 1200
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_distribution.mac 938 939 956 1001 1200
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_load_ensembles.mac
cd..
cd hbwork_inc2
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_initialize_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_initialize_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_import_matrices_ag.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_friction_factors.mac 938 939 956 1001 1200
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_distribution.mac 938 939 956 1001 1200
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_load_ensembles.mac
cd..
cd hbwork_inc3
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_initialize_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_initialize_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_import_matrices_ag.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_friction_factors.mac 938 939 956 1001 1200
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_distribution.mac 938 939 956 1001 1200
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_load_ensembles.mac
cd..
cd hbwork_inc4
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_initialize_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_initialize_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_import_matrices_ag.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_friction_factors.mac 938 939 956 1001 1200
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_distribution.mac 938 939 956 1001 1200
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_load_ensembles.mac
cd..
cd hbcollege
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_initialize_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_initialize_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_import_matrices_ag.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_friction_factors.mac 938 939 956 1001 1200
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_distribution.mac 938 939 956 1001 1200
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_load_ensembles.mac
cd..
cd hbshop
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_initialize_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_initialize_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_import_matrices_ag.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_friction_factors.mac 938 939 956 1001 1200
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_distribution.mac 938 939 956 1001 1200
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_load_ensembles.mac
cd..
cd hbother
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_initialize_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_initialize_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_import_matrices_ag.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_friction_factors.mac 938 939 956 1001 1200
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_distribution.mac 938 939 956 1001 1200
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_load_ensembles.mac
cd..
cd hbschool
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_initialize_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_initialize_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_import_matrices_ag.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_friction_factors.mac 938 939 956 1001 1200
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_distribution.mac 938 939 956 1001 1200
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_load_ensembles.mac
cd..
cd nhbwork
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_initialize_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_initialize_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_import_matrices_ag.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_friction_factors.mac 938 939 956 1001 1200
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_distribution.mac 938 939 956 1001 1200
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_load_ensembles.mac
cd..
cd nhbother
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_initialize_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_initialize_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_import_matrices_ag.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_friction_factors.mac 938 939 956 1001 1200
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_distribution.mac 938 939 956 1001 1200
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_load_ensembles.mac
cd..