cd AM
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM call AM assignment setup macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\1_initialize_am_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2_initialize_am_full_matrices.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m Macros\2-9_import_am_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3_initialize_am_vdfs.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\4_initialize_am_extra_attributes.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\5_input_am_tolls.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\5-8_input_bridge_flags.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\5-9_input_am_triptables.mac
cd ..