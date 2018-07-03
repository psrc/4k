REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM File created by PSRC staff
REM Batch file to initialize all the matrices and data needed for auto assignments
REM Runs the EV Auto, Transit and Walk and Bike Assignments
REM Only copies in trip tables for iteration >0
REM Utilizes warm starts for all iterations

cd ev
if %iternum% == 0 (
     call emme -ng 000 -m ..\macros\1_initialize_matrices.mac e 1005
     call emme -ng 000 -m ..\macros\2_initialize_networks.mac ev 1005 %highpnr%
     call emme -ng 000 -m ..\macros\3_read_inputs.mac ev 1005
)

call emme -ng 000 -m ..\macros\5_auto_assignment.mac %ev_iter% %brgap% %iternum% 1005 e

if %iternum% == 0 (
     call emme -ng 000 -m ..\macros\6_walk_bike_assignment.mac e 1005
)

call emme -ng 000 -m ..\macros\7_transit_assignment.mac e 1005
call emme -ng 000 -m ..\macros\8_calculate_total_vehicles.mac 1005

cd ..
echo "EV assignment finished" > doneEV.ind
exit