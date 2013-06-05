REM begin pnr skims
cd Income1
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM call pnr income group 1 skim macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2_initialize_pnr_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2-9_initialize_pnr_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3_initialize_pnr_inc1_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3-9_input_pnr_lot_charges.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\4_import_inc1_bidirectional_cost_matrices.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m Macros\4-9_import_am_inc1_auto_skim_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\5_import_am_transit_skim_matrices.mac
cd..
cd Income2
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM call pnr income group 2 skim macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2_initialize_pnr_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2-9_initialize_pnr_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3_initialize_pnr_inc2_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3-9_input_pnr_lot_charges.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\4_import_inc2_bidirectional_cost_matrices.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m Macros\4-9_import_am_inc2_auto_skim_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\5_import_am_transit_skim_matrices.mac
cd..
cd Income3
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM call pnr income group 3 skim macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2_initialize_pnr_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2-9_initialize_pnr_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3_initialize_pnr_inc3_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3-9_input_pnr_lot_charges.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\4_import_inc3_bidirectional_cost_matrices.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m Macros\4-9_import_am_inc3_auto_skim_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\5_import_am_transit_skim_matrices.mac
cd..
cd Income4
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM call pnr income group 4 skim macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\1_import_centroids_only_network.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2_initialize_pnr_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2-9_initialize_pnr_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3_initialize_pnr_inc4_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3-9_input_pnr_lot_charges.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\4_import_inc4_bidirectional_cost_matrices.mac
REM call emme -ng --set-iks 127.0.0.1 000 -m Macros\4-9_import_am_inc4_auto_skim_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\5_import_am_transit_skim_matrices.mac
cd..
REM erase all existing indicator (.ind) files
if exist *.ind erase *.ind
REM start income 1 pnr skims
start batchfiles\pnr_income1_skims.bat
REM start income 2 pnr skims
start batchfiles\pnr_income2_skims.bat
REM start income 3 pnr skims
start batchfiles\pnr_income3_skims.bat
REM start income 4 pnr skims
start batchfiles\pnr_income4_skims.bat
