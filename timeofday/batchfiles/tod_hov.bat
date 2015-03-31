REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM Created by PSRC staff
REM Runs the Time of Day Choice for the HOV Modes for HBShop, HBO and HBW

cd hov

REM Initialize the Bank
call emme -ng 000 -m macros\1_initialize_matrices.mac
call emme -ng 000 -m macros\2_initialize_origin_matrices.mac
call emme -ng 000 -m macros\3_initialize_destination_matrices.mac
call emme -ng 000 -m macros\4_initialize_full_matrices.mac
call emme -ng 000 -m macros\5_import_data.mac
call emme -ng 000 -m macros\6_calculate_hh_size.mac
call emme -ng 000 -m macros\7_import_matrices.mac
call emme -ng 000 -m macros\8_calculate_adjusted_delay.mac
call emme -ng 000 -m macros\9_calculate_adjusted_bridge_flag.mac
call emme -ng 000 -m macros\10_calculate_hbwork_hov_a-p_tod_shares.mac
call emme -ng 000 -m macros\11_calculate_hbwork_hov_p-a_tod_shares.mac
call emme -ng 000 -m macros\12_calculate_hbshop_hov_a-p_tod_shares.mac
call emme -ng 000 -m macros\13_calculate_hbshop_hov_p-a_tod_shares.mac
call emme -ng 000 -m macros\14_calculate_hbother_hov_a-p_tod_shares.mac
call emme -ng 000 -m macros\15_calculate_hbother_hov_p-a_tod_shares.mac

REM write indicator file
cd ..
echo "HOV Time of Day Model finished" > doneHOV.ind
exit
