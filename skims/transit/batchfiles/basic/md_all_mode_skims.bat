cd md\all_mode
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM call MD transit skim macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\1_initialize_md_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2_initialize_md_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3_initialize_md_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\4_initialize_md_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\5_import_md_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_import_md_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\7_calculate_md_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\8_calculate_md_fares.mac
cd ..\..