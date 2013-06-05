cd am\all_mode
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM call AM transit assignment macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\1_initialize_am_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2_initialize_am_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3_import_am_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3-9_initialize_am_vdfs.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3-9-9-9_modify_mode_x.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\4_am_transit_assignment.mac
cd ..\..