REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM File created by PSRC staff
REM Batch file to create truck trip tables by time of day
REM Trip tables are created for all 5 time periods using fixed factors
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_initialize_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_origin_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_initialize_destination_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_initialize_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\7_input_data.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_import_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_daily_od_trips.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_apply_time_of_day_factors.mac
