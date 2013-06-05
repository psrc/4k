cd Generalized_Cost
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM call bidirectional generalized cost skim macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2_initialize_bidirectional_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3_initialize_bidirectional_generalized_cost_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\4_import_am_generalized_cost_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\5_import_pm_generalized_cost_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\5-9_import_md_generalized_cost_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_calculate_bidirectional_generalized_cost.mac
cd..