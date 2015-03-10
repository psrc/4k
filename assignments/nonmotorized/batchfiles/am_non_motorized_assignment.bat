cd am
if exist *.rpt erase *.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_initialize_am_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_am_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_import_am_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_am_vdfs.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_am_walk_assignment.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_am_bike_assignment.mac
cd..