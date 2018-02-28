REM Puget Sound 4k: Trip Based Model
REM Updated December 2017
REM Created by PSRC staff
REM Averages AM & PM Skims to get skims for a total trip

cd all

call emme -ng 000 -m ..\macros\1_initialize_matrices.mac
call emme -ng 000 -m ..\macros\2_calculate_bidirectional_distance.mac
call emme -ng 000 -m ..\macros\3_calculate_bidirectional_generalized_cost.mac
call emme -ng 000 -m ..\macros\4_calculate_bidirectional_time.mac

cd ..