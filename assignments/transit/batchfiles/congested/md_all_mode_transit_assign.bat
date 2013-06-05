cd md\all_mode
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM call MD transit assignment macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\1_initialize_md_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2_initialize_md_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3_import_md_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3-9_initialize_md_vdfs.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3-9-9_input_md_transittriptable.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3-9-9-9_modify_mode_x.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\4_md_transit_assignment.mac
cd ..\..