REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM Created by PSRC staff
REM Calculates the Generalized Cost Delay by Time of Day
REM Free-Flow is considered the overnight period

cd allpurposes
call emme -ng 000 -m macros\1_initialize_matrices.mac
call emme -ng 000 -m macros\2_initialize_full_matrices.mac
call emme -ng 000 -m macros\3_import_matrices.mac
call emme -ng 000 -m macros\4_calculate_delay.mac
cd ..