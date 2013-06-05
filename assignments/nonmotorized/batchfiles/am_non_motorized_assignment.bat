cd AM
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM call non-motorized assignment macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\1_initialize_am_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2_initialize_am_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3_import_am_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\4_initialize_am_vdfs.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\5_am_walk_assignment.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_am_bike_assignment.mac
cd..