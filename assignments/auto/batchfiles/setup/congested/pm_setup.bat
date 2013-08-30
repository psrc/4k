cd pm
if exist *.rpt erase *.rpt
REM call pm assignment setup macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\1_initialize_pm_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\1-9_initialize_pm_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2_initialize_pm_full_matrices.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m Macros\2-9_import_pm_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3_initialize_pm_vdfs.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m Macros\4_initialize_pm_extra_attributes.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\5_input_pm_tolls.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\5-7_input_pm_vot_parameters.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m Macros\5-9_input_pm_triptables.mac
cd ..