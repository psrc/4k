REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM Created by PSRC staff
REM Runs the Time of Day Choice for the SOV Modes for HBShop, HBO and HBW

cd sov

REM Initialize the Bank
call emme -ng 000 -m macros\initial\1_initialize_matrices.mac
call emme -ng 000 -m macros\initial\2_initialize_origin_matrices.mac
call emme -ng 000 -m macros\initial\3_initialize_destination_matrices.mac
call emme -ng 000 -m macros\initial\4_initialize_full_matrices.mac
call emme -ng 000 -m macros\initial\5_import_data.mac
call emme -ng 000 -m macros\initial\6_calculate_hh_size.mac

REM Home Based Other
call emme -ng 000 -m macros\hbother\1_import_matrices.mac
call emme -ng 000 -m macros\hbother\2_calculate_adjusted_delay.mac
call emme -ng 000 -m macros\hbother\3_calculate_adjusted_bridge_flag.mac
call emme -ng 000 -m macros\hbother\4_calculate_hbother_sov_a-p_tod_shares.mac
call emme -ng 000 -m macros\hbother\5_calculate_hbother_sov_p-a_tod_shares.mac

REM Home Based Shopping
call emme -ng 000 -m macros\hbshop\1_import_matrices.mac
call emme -ng 000 -m macros\hbshop\2_calculate_adjusted_delay.mac
call emme -ng 000 -m macros\hbshop\3_calculate_adjusted_bridge_flag.mac
call emme -ng 000 -m macros\hbshop\4_calculate_hbshop_sov_a-p_tod_shares.mac
call emme -ng 000 -m macros\hbshop\5_calculate_hbshop_sov_p-a_tod_shares.mac

REM Home Based Work Income #1
call emme -ng 000 -m macros\income1\1_import_matrices.mac
call emme -ng 000 -m macros\income1\2_calculate_adjusted_delay.mac
call emme -ng 000 -m macros\income1\3_calculate_adjusted_bridge_flag.mac
call emme -ng 000 -m macros\income1\4_calculate_hbwork_inc1_sov_a-p_tod_shares.mac
call emme -ng 000 -m macros\income1\5_calculate_hbwork_inc1_sov_p-a_tod_shares.mac

REM Home Based Work Income #2
call emme -ng 000 -m macros\income2\1_import_matrices.mac
call emme -ng 000 -m macros\income2\2_calculate_adjusted_delay.mac
call emme -ng 000 -m macros\income2\3_calculate_adjusted_bridge_flag.mac
call emme -ng 000 -m macros\income2\4_calculate_hbwork_inc2_sov_a-p_tod_shares.mac
call emme -ng 000 -m macros\income2\5_calculate_hbwork_inc2_sov_p-a_tod_shares.mac

REM Home Based Work Income #3
call emme -ng 000 -m macros\income3\1_import_matrices.mac
call emme -ng 000 -m macros\income3\2_calculate_adjusted_delay.mac
call emme -ng 000 -m macros\income3\3_calculate_adjusted_bridge_flag.mac
call emme -ng 000 -m macros\income3\4_calculate_hbwork_inc3_sov_a-p_tod_shares.mac
call emme -ng 000 -m macros\income3\5_calculate_hbwork_inc3_sov_p-a_tod_shares.mac

REM Home Based Work Income #4
call emme -ng 000 -m macros\income4\1_import_matrices.mac
call emme -ng 000 -m macros\income4\2_calculate_adjusted_delay.mac
call emme -ng 000 -m macros\income4\3_calculate_adjusted_bridge_flag.mac
call emme -ng 000 -m macros\income4\4_calculate_hbwork_inc4_sov_a-p_tod_shares.mac
call emme -ng 000 -m macros\income4\5_calculate_hbwork_inc4_sov_p-a_tod_shares.mac

REM write indicator file
cd ..
echo "SOV Time of Day Model finished" > doneSOV.ind
exit
