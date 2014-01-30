cd hbwork_inc1
if exist *.rpt erase *.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_initialize_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_initialize_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6-9_input_data.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_import_matrices_tg.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_friction_factors.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_distribution.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_load_ensembles.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_input_survey_data.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_distribution_summary.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\13_distribution_externals_summary.mac
cd ..
cd hbwork_inc2
if exist *.rpt erase *.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_initialize_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_initialize_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6-9_input_data.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_import_matrices_tg.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_friction_factors.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_distribution.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_load_ensembles.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_input_survey_data.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_distribution_summary.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\13_distribution_externals_summary.mac
cd ..
cd hbwork_inc3
if exist *.rpt erase *.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_initialize_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_initialize_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6-9_input_data.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_import_matrices_tg.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_friction_factors.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_distribution.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_load_ensembles.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_input_survey_data.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_distribution_summary.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\13_distribution_externals_summary.mac
cd ..
cd hbwork_inc4
if exist *.rpt erase *.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_initialize_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_initialize_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6-9_input_data.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_import_matrices_tg.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_friction_factors.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_distribution.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_load_ensembles.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_input_survey_data.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_distribution_summary.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\13_distribution_externals_summary.mac
cd ..
cd hbcollege
if exist *.rpt erase *.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_initialize_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_initialize_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6-9_input_data.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_import_matrices_tg.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_friction_factors.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_distribution.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_load_ensembles.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_input_survey_data.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_distribution_summary.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\13_distribution_externals_summary.mac
cd ..
cd hbshop
if exist *.rpt erase *.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_initialize_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_initialize_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6-9_input_data.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_import_matrices_tg.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_friction_factors.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_distribution.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_load_ensembles.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_input_survey_data.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_distribution_summary.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\13_distribution_externals_summary.mac
cd ..
cd hbother
if exist *.rpt erase *.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_initialize_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_initialize_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6-9_input_data.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_import_matrices_tg.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_friction_factors.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_distribution.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_load_ensembles.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_input_survey_data.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_distribution_summary.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\13_distribution_externals_summary.mac
cd ..
cd hbschool
if exist *.rpt erase *.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_initialize_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_initialize_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6-9_input_data.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_import_matrices_tg.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_friction_factors.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_distribution.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_load_ensembles.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_input_survey_data.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_distribution_summary.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\13_distribution_externals_summary.mac
cd ..
cd nhbwork
if exist *.rpt erase *.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_initialize_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_initialize_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6-9_input_data.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_import_matrices_tg.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_friction_factors.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_distribution.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_load_ensembles.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_input_survey_data.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_distribution_summary.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\13_distribution_externals_summary.mac
cd ..
cd nhbother
if exist *.rpt erase *.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_initialize_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_initialize_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6-9_input_data.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_import_matrices_tg.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_friction_factors.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_distribution.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_load_ensembles.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_input_survey_data.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_distribution_summary.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\13_distribution_externals_summary.mac
cd ..