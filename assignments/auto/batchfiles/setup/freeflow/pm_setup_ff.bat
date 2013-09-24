cd pm
if exist *.rpt erase *.rpt
REM call pm assignment setup macros
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_initialize_pm_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\1-9_initialize_pm_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_pm_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2-9_import_pm_network.mac
cd ..