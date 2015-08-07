REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM File created by PSRC staff
REM Batch file to create od trip tables for assignment and skims

REM First Set-up the bank
call emme -ng 000 -m macros\initial\1_initialize_matrices.mac %BCA%
call emme -ng 000 -m macros\initial\2_initialize_full_matrices.mac
call emme -ng 000 -m macros\initial\3_load_ensembles.mac
call emme -ng 000 -m macros\initial\4_input_daily_vanpool_demand.mac
call emme -ng 000 -m macros\initial\5_input_daily_thru_trips.mac
call emme -ng 000 -m macros\initial\6_import_distribution_matrices.mac
call emme -ng 000 -m macros\initial\7_input_data.mac

REM Create Trip Tables by Time of Day - Fixed Time of Day Factors
call emme -ng 000 -m macros\1_transit_trip_tables.mac am md pm ev ni a m p e n
call emme -ng 000 -m macros\2_walk_trip_tables.mac am md pm ev ni a m p e n
call emme -ng 000 -m macros\3_bike_trip_tables.mac am md pm ev ni a m p e n
call emme -ng 000 -m macros\4_vanpool_trip_tables.mac
call emme -ng 000 -m macros\5_truck_trip_tables.mac
call emme -ng 000 -m macros\6_sov_nw_trip_tables.mac am md pm ev ni a m p e n

REM Create all AM Peak Period Trip Tables
call emme -ng 000 -m macros\am\5_hov2_trip_tables.mac
call emme -ng 000 -m macros\am\6_hov3_trip_tables.mac
call emme -ng 000 -m macros\am\9_sov_hbw1_trip_tables.mac
call emme -ng 000 -m macros\am\10_sov_hbw2_trip_tables.mac
call emme -ng 000 -m macros\am\11_sov_hbw3_trip_tables.mac
call emme -ng 000 -m macros\am\12_sov_hbw4_trip_tables.mac

REM Create all Midday Period Trip Tables
call emme -ng 000 -m macros\md\5_hov2_trip_tables.mac
call emme -ng 000 -m macros\md\6_hov3_trip_tables.mac
call emme -ng 000 -m macros\md\9_sov_hbw1_trip_tables.mac
call emme -ng 000 -m macros\md\10_sov_hbw2_trip_tables.mac
call emme -ng 000 -m macros\md\11_sov_hbw3_trip_tables.mac
call emme -ng 000 -m macros\md\12_sov_hbw4_trip_tables.mac

REM Create all PM Peak Period Trip Tables
call emme -ng 000 -m macros\pm\5_hov2_trip_tables.mac
call emme -ng 000 -m macros\pm\6_hov3_trip_tables.mac
call emme -ng 000 -m macros\pm\9_sov_hbw1_trip_tables.mac
call emme -ng 000 -m macros\pm\10_sov_hbw2_trip_tables.mac
call emme -ng 000 -m macros\pm\11_sov_hbw3_trip_tables.mac
call emme -ng 000 -m macros\pm\12_sov_hbw4_trip_tables.mac

REM Create all Late Evening Period Trip Tables
call emme -ng 000 -m macros\ev\5_hov2_trip_tables.mac
call emme -ng 000 -m macros\ev\6_hov3_trip_tables.mac
call emme -ng 000 -m macros\ev\9_sov_hbw1_trip_tables.mac
call emme -ng 000 -m macros\ev\10_sov_hbw2_trip_tables.mac
call emme -ng 000 -m macros\ev\11_sov_hbw3_trip_tables.mac
call emme -ng 000 -m macros\ev\12_sov_hbw4_trip_tables.mac

REM Create all Overnight Period Trip Tables
call emme -ng 000 -m macros\ni\5_hov2_trip_tables.mac
call emme -ng 000 -m macros\ni\6_hov3_trip_tables.mac
call emme -ng 000 -m macros\ni\9_sov_hbw1_trip_tables.mac
call emme -ng 000 -m macros\ni\10_sov_hbw2_trip_tables.mac
call emme -ng 000 -m macros\ni\11_sov_hbw3_trip_tables.mac
call emme -ng 000 -m macros\ni\12_sov_hbw4_trip_tables.mac

