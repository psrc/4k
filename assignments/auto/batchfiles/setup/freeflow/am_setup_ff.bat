cd am
if exist *.rpt erase *.rpt
REM call am assignment setup macros
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_initialize_am_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\1-9_initialize_am_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_am_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2-9_import_am_network.mac
cd ..