cd am\all_mode
if exist *.rpt erase *.rpt
REM call am transit assignment macros
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_initialize_am_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_am_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_import_am_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3-9_initialize_am_vdfs.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3-9-9_input_am_transittriptable.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3-9-9-9_modify_mode_x.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_am_transit_assignment.mac
cd ..\..