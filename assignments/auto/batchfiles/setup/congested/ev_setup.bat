cd EV
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM call EV assignment setup macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\1_initialize_ev_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2_initialize_ev_full_matrices.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m Macros\2-9_import_ev_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3_initialize_ev_vdfs.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\4_initialize_ev_extra_attributes.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\5_input_ev_tolls.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\5-9_input_ev_triptables.mac
cd ..