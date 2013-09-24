cd md
if exist *.rpt erase *.rpt
REM call md assignment setup macros
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_initialize_md_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\1-9_initialize_md_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_md_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2-9_import_md_network.mac
cd ..