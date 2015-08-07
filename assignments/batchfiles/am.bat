REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM File created by PSRC staff
REM Batch file to initialize all the matrices and data needed for auto assignments
REM Runs the AM Auto, Transit and Walk and Bike Assignments
REM Only copies in trip tables for iteration >0
REM Utilizes warm starts for all iterations

cd am
if %iternum% == 0 (
     call emme -ng 000 -m ..\macros\1_initialize_matrices.mac a 1002
     call emme -ng 000 -m ..\macros\2_initialize_networks.mac am 1002 %highpnr%
     call emme -ng 000 -m ..\macros\3_read_inputs.mac am 1002
)

call emme -ng 000 -m ..\macros\5_auto_assignment.mac %am_iter% %brgap% %iternum% 1002 a

if %iternum% == 0 (
     call emme -ng 000 -m ..\macros\6_walk_bike_assignment.mac a 1002
)

call emme -ng 000 -m ..\macros\7_transit_assignment.mac a 1002
call emme -ng 000 -m ..\macros\8_calculate_total_vehicles.mac 1002

cd ..
echo "AM assignment finished" > doneAM.ind
exit