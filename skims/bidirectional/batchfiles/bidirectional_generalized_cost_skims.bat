cd generalized_cost
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_bidirectional_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_bidirectional_generalized_cost_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_import_am_generalized_cost_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_import_pm_generalized_cost_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5-9_import_md_generalized_cost_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_calculate_bidirectional_generalized_cost.mac
cd..