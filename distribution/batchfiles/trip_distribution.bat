REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM File created by PSRC staff
REM Batch file to run trip distribution of the travel model.
REM All Purposes are run in the same bank, sequentially.
REM Matrices are re-initialized each iteration

cd all

REM Initialize Matrices
call emme -ng 000 -m macros\initial\1_initialize_matrices.mac
call emme -ng 000 -m macros\initial\2_initialize_scalars.mac
call emme -ng 000 -m macros\initial\3_initialize_full_matrices.mac
call emme -ng 000 -m macros\initial\4_load_ensembles.mac
call emme -ng 000 -m macros\initial\5_input_data.mac

REM College Trip Distribution
call emme -ng 000 -m macros\hbcollege\1_import_matrices.mac
call emme -ng 000 -m macros\hbcollege\2_calculate_friction_factors.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbcollege\3_calculate_distribution.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%

REM Home Based Other Trip Distribution
call emme -ng 000 -m macros\hbother\1_import_matrices.mac
call emme -ng 000 -m macros\hbother\2_calculate_friction_factors.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbother\3_calculate_distribution.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%

REM Home Based School Trip Distribution
call emme -ng 000 -m macros\hbschool\1_import_matrices.mac
call emme -ng 000 -m macros\hbschool\2_calculate_friction_factors.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbschool\3_calculate_distribution.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%

REM Home Based Shopping Trip Distribution
call emme -ng 000 -m macros\hbshop\1_import_matrices.mac
call emme -ng 000 -m macros\hbshop\2_calculate_friction_factors.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbshop\3_calculate_distribution.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%

REM Home Based Work Income #1 Trip Distribution
call emme -ng 000 -m macros\hbwork_inc1\1_import_matrices.mac
call emme -ng 000 -m macros\hbwork_inc1\2_calculate_friction_factors.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc1\3_calculate_distribution.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%

REM Home Based Work Income #2 Trip Distribution
call emme -ng 000 -m macros\hbwork_inc2\1_import_matrices.mac
call emme -ng 000 -m macros\hbwork_inc2\2_calculate_friction_factors.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc2\3_calculate_distribution.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%

REM Home Based Work Income #3 Trip Distribution
call emme -ng 000 -m macros\hbwork_inc3\1_import_matrices.mac
call emme -ng 000 -m macros\hbwork_inc3\2_calculate_friction_factors.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc3\3_calculate_distribution.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%

REM Home Based Work Income #4 Trip Distribution
call emme -ng 000 -m macros\hbwork_inc4\1_import_matrices.mac
call emme -ng 000 -m macros\hbwork_inc4\2_calculate_friction_factors.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\hbwork_inc4\3_calculate_distribution.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%

REM Non-Home Based Other Trip Distribution
call emme -ng 000 -m macros\nhbother\1_import_matrices.mac
call emme -ng 000 -m macros\nhbother\2_calculate_friction_factors.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\nhbother\3_calculate_distribution.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%

REM Non-Home Based Work Trip Distribution
call emme -ng 000 -m macros\nhbwork\1_import_matrices.mac
call emme -ng 000 -m macros\nhbwork\2_calculate_friction_factors.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\nhbwork\3_calculate_distribution.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%

REM Light Truck Trip Distribution
call emme -ng 000 -m macros\trucks_light\1_import_matrices.mac
call emme -ng 000 -m macros\trucks_light\2_balanced_refactored_atrractions.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\trucks_light\3_calculate_impedances.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\trucks_light\4_distribute_truck_trips.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%

REM Medium Truck Trip Distribution
call emme -ng 000 -m macros\trucks_medium\1_import_matrices.mac
call emme -ng 000 -m macros\trucks_medium\2_balanced_refactored_atrractions.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\trucks_medium\3_calculate_impedances.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\trucks_medium\4_distribute_truck_trips.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%

REM Heavy Truck Trip Distribution
call emme -ng 000 -m macros\trucks_heavy\1_import_matrices.mac
call emme -ng 000 -m macros\trucks_heavy\2_balanced_refactored_atrractions.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\trucks_heavy\3_calculate_impedances.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\trucks_heavy\4_distribute_truck_trips.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%

cd ..