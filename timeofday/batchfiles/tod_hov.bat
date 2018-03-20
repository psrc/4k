REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM Created by PSRC staff
REM Runs the Time of Day Choice for the HOV Modes for HBShop, HBO and HBW

cd hov

REM Run Time of Day for HOV trips
call emme -ng 000 -m macros\1_initialization.mac
call emme -ng 000 -m macros\2_calculate_hbwork_hov_a-p_tod_shares.mac
call emme -ng 000 -m macros\3_calculate_hbwork_hov_p-a_tod_shares.mac
call emme -ng 000 -m macros\4_calculate_hbother_hov_a-p_tod_shares.mac
call emme -ng 000 -m macros\5_calculate_hbother_hov_p-a_tod_shares.mac

REM write indicator file
cd ..
echo "HOV Time of Day Model finished" > doneHOV.ind
exit
