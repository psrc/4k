cd am
if exist *.rpt erase *.rpt
REM call non-motorized skim macros
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_initialize_am_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_am_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_import_am_nonmotorized_scenario.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_import_nonmotorized_assignment_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_import_iz_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_calculate_nonmotorized_skims.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m macros\7_export_files_for_urbansim.mac
cd ..