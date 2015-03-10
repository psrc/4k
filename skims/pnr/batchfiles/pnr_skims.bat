REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM File created by PSRC staff
REM Batch File to begin pnr skims
cd income1
if exist *.rpt erase *.rpt
REM call pnr income group 1 skim macros
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_pnr_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2-8_initialize_pnr_scalar_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2-9_initialize_pnr_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_pnr_inc1_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3-9_input_pnr_lot_charges.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\3-9-9_set_zone_system_parameters.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_import_inc1_bidirectional_cost_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_import_am_transit_skim_matrices.mac
cd..
cd income2
if exist *.rpt erase *.rpt
REM call pnr income group 2 skim macros
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_pnr_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2-8_initialize_pnr_scalar_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2-9_initialize_pnr_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_pnr_inc2_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3-9_input_pnr_lot_charges.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\3-9-9_set_zone_system_parameters.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_import_inc2_bidirectional_cost_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_import_am_transit_skim_matrices.mac
cd..
cd income3
if exist *.rpt erase *.rpt
REM call pnr income group 3 skim macros
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_pnr_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2-8_initialize_pnr_scalar_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2-9_initialize_pnr_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_pnr_inc3_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3-9_input_pnr_lot_charges.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\3-9-9_set_zone_system_parameters.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_import_inc3_bidirectional_cost_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_import_am_transit_skim_matrices.mac
cd..
cd income4
if exist *.rpt erase *.rpt
REM call pnr income group 4 skim macros
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_pnr_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2-8_initialize_pnr_scalar_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2-9_initialize_pnr_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_pnr_inc4_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3-9_input_pnr_lot_charges.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\3-9-9_set_zone_system_parameters.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_import_inc4_bidirectional_cost_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_import_am_transit_skim_matrices.mac
cd..
REM erase all existing indicator (.ind) files
if exist *.ind erase *.ind
start batchfiles\pnr_income1_skims.bat
start batchfiles\pnr_income2_skims.bat
start batchfiles\pnr_income3_skims.bat
start batchfiles\pnr_income4_skims.bat
