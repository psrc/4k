REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM File created by PSRC staff
REM Batch file to run mode choice in the travel model.
REM All Purposes are run in the same bank, sequentially.
REM Matrices are re-initialized each iteration

cd all

REM Initialize Matrices
call emme -ng 000 -m macros\initial\1_initialize_matrices.mac
call emme -ng 000 -m macros\initial\2_initialize_scalars.mac
call emme -ng 000 -m macros\initial\3_initialize_origin_matrices.mac
call emme -ng 000 -m macros\initial\4_initialize_destination_matrices.mac
call emme -ng 000 -m macros\initial\5_initialize_full_matrices.mac
call emme -ng 000 -m macros\initial\6_load_ensembles.mac

REM Home Based College Mode Choice
call emme -ng 000 -m macros\hbcollege\0_reset_utilities.mac
call emme -ng 000 -m macros\hbcollege\1_input_data.mac
call emme -ng 000 -m macros\hbcollege\2_import_matrices.mac
call emme -ng 000 -m macros\hbcollege\3_calculate_auto_cost_skims.mac
call emme -ng 000 -m macros\hbcollege\4_calculate_drive_alone_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbcollege\5_calculate_shared_ride_2_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbcollege\6_calculate_shared_ride_3+_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbcollege\7_calculate_transit_walk_access_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbcollege\8_calculate_bike_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbcollege\9_calculate_walk_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbcollege\10_calculate_mode_shares.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%

REM Home Based Other Mode Choice
call emme -ng 000 -m macros\hbnonwork\0_reset_utilities.mac
call emme -ng 000 -m macros\hbnonwork\1_input_data.mac
call emme -ng 000 -m macros\hbnonwork\2_import_matrices.mac
call emme -ng 000 -m macros\hbnonwork\3_calculate_auto_cost_skims.mac
call emme -ng 000 -m macros\hbnonwork\4_calculate_drive_alone_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbnonwork\5_calculate_shared_ride_2_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbnonwork\6_calculate_shared_ride_3+_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbnonwork\7_calculate_transit_walk_access_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbnonwork\8_calculate_bike_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbnonwork\9_calculate_walk_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbnonwork\10_calculate_mode_shares.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%

REM Home Based School Mode Choice
call emme -ng 000 -m macros\hbschool\0_reset_utilities.mac
call emme -ng 000 -m macros\hbschool\1_input_data.mac
call emme -ng 000 -m macros\hbschool\2_import_matrices.mac
call emme -ng 000 -m macros\hbschool\3_calculate_auto_cost_skims.mac
call emme -ng 000 -m macros\hbschool\4_calculate_drive_alone_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbschool\5_calculate_shared_ride_2_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbschool\6_calculate_shared_ride_3+_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbschool\7_calculate_transit_walk_access_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbschool\8_calculate_bike_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbschool\9_calculate_walk_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbschool\10_calculate_mode_shares.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%

REM Non-Home Based Mode Choice
call emme -ng 000 -m macros\nhb\0_reset_utilities.mac
call emme -ng 000 -m macros\nhb\1_input_data.mac
call emme -ng 000 -m macros\nhb\2_import_matrices.mac
call emme -ng 000 -m macros\nhb\3_calculate_auto_cost_skims.mac
call emme -ng 000 -m macros\nhb\4_calculate_drive_alone_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\nhb\5_calculate_shared_ride_2_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\nhb\6_calculate_shared_ride_3+_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\nhb\7_calculate_transit_walk_access_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\nhb\8_calculate_bike_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\nhb\9_calculate_walk_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\nhb\10_calculate_mode_shares.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%

REM Home Based Work Income #1 Mode Choice
call emme -ng 000 -m macros\hbwork_inc1\0_reset_utilities.mac
call emme -ng 000 -m macros\hbwork_inc1\1_input_data.mac
call emme -ng 000 -m macros\hbwork_inc1\2_import_matrices.mac
call emme -ng 000 -m macros\hbwork_inc1\3_calculate_auto_cost_skims.mac
call emme -ng 000 -m macros\hbwork_inc1\4_calculate_drive_alone_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc1\5_calculate_shared_ride_2_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc1\6_calculate_shared_ride_3+_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc1\7_calculate_transit_walk_access_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc1\8_calculate_transit_drive_access_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc1\9_calculate_bike_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc1\10_calculate_walk_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc1\11_calculate_log_sums.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc1\12_calculate_mode_shares.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%

REM Home Based Work Income #2 Mode Choice
call emme -ng 000 -m macros\hbwork_inc2\0_reset_utilities.mac
call emme -ng 000 -m macros\hbwork_inc2\1_input_data.mac
call emme -ng 000 -m macros\hbwork_inc2\2_import_matrices.mac
call emme -ng 000 -m macros\hbwork_inc2\3_calculate_auto_cost_skims.mac
call emme -ng 000 -m macros\hbwork_inc2\4_calculate_drive_alone_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc2\5_calculate_shared_ride_2_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc2\6_calculate_shared_ride_3+_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc2\7_calculate_transit_walk_access_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc2\8_calculate_transit_drive_access_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc2\9_calculate_bike_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc2\10_calculate_walk_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc2\11_calculate_log_sums.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc2\12_calculate_mode_shares.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%

REM Home Based Work Income #3 Mode Choice
call emme -ng 000 -m macros\hbwork_inc3\0_reset_utilities.mac
call emme -ng 000 -m macros\hbwork_inc3\1_input_data.mac
call emme -ng 000 -m macros\hbwork_inc3\2_import_matrices.mac
call emme -ng 000 -m macros\hbwork_inc3\3_calculate_auto_cost_skims.mac
call emme -ng 000 -m macros\hbwork_inc3\4_calculate_drive_alone_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc3\5_calculate_shared_ride_2_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc3\6_calculate_shared_ride_3+_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc3\7_calculate_transit_walk_access_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc3\8_calculate_transit_drive_access_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc3\9_calculate_bike_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc3\10_calculate_walk_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc3\11_calculate_log_sums.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc3\12_calculate_mode_shares.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%

REM Home Based Work Income #4 Mode Choice
call emme -ng 000 -m macros\hbwork_inc4\0_reset_utilities.mac
call emme -ng 000 -m macros\hbwork_inc4\1_input_data.mac
call emme -ng 000 -m macros\hbwork_inc4\2_import_matrices.mac
call emme -ng 000 -m macros\hbwork_inc4\3_calculate_auto_cost_skims.mac
call emme -ng 000 -m macros\hbwork_inc4\4_calculate_drive_alone_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc4\5_calculate_shared_ride_2_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc4\6_calculate_shared_ride_3+_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc4\7_calculate_transit_walk_access_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc4\8_calculate_transit_drive_access_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc4\9_calculate_bike_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc4\10_calculate_walk_utility.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc4\11_calculate_log_sums.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc4\12_calculate_mode_shares.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%

cd ..
