cd Time
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM call bidirectional time skim macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2_initialize_bidirectional_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3_initialize_bidirectional_time_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\4_import_am_time_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\5_import_pm_time_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\5-9_import_md_time_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_calculate_bidirectional_time.mac
cd..