cd ev
if exist *.rpt erase *.rpt
REM call ev assignment setup macros
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_initialize_ev_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\1-9_initialize_ev_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_ev_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2-9_import_ev_network.mac
cd ..