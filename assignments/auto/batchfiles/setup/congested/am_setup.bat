cd am
if exist *.rpt erase *.rpt
REM call am assignment setup macros
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_initialize_am_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\1-9_initialize_am_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_am_full_matrices.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\2-9_import_am_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_am_vdfs.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_am_extra_attributes.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_input_am_tolls.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5-7_input_am_vot_parameters.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5-8_input_bridge_flags.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5-9_input_am_triptables.mac
cd ..