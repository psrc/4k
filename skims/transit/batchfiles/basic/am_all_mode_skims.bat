cd am\all_mode
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM call AM transit skim macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\1_initialize_am_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2_initialize_am_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3_initialize_am_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\4_initialize_am_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\5_import_am_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_import_am_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\7_calculate_am_skims.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\8_calculate_am_fares.mac
cd ..\..