cd NI
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM call NI assignment setup macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\1_initialize_ni_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2_initialize_ni_full_matrices.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m Macros\2-9_import_ni_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3_initialize_ni_vdfs.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\4_initialize_ni_extra_attributes.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\5_input_ni_tolls.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\5-9_input_ni_triptables.mac
cd ..