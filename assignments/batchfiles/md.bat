REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM File created by PSRC staff
REM Batch file to initialize all the matrices and data needed for auto assignments
REM Runs the MD Auto, Transit and Walk and Bike Assignments
REM Only copies in trip tables for iteration >0
REM Utilizes warm starts for all iterations

cd md
if %iternum% == 0 (
     call emme -ng 000 -m ..\macros\1_initialize_matrices.mac m 1004
     call emme -ng 000 -m ..\macros\2_initialize_networks.mac md 1004 %highpnr%
     call emme -ng 000 -m ..\macros\3_read_inputs.mac md 1004
)

call emme -ng 000 -m ..\macros\5_auto_assignment.mac %md_iter% %brgap% %iternum% 1004 m

if %iternum% == 0 (
     call emme -ng 000 -m ..\macros\6_walk_bike_assignment.mac m 1004
)

call emme -ng 000 -m ..\macros\7_transit_assignment.mac m 1004
call emme -ng 000 -m ..\macros\8_calculate_total_vehicles.mac 1004

cd ..
echo "MD assignment finished" > doneMD.ind
exit