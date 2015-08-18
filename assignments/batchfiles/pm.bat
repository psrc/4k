REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM File created by PSRC staff
REM Batch file to initialize all the matrices and data needed for auto assignments
REM Runs the PM Auto Assignments
REM Only copies in trip tables for iteration >0
REM Utilizes warm starts for all iterations

cd pm
if %iternum% == 0 (
     call emme -ng 000 -m ..\macros\1_initialize_matrices.mac p 1003
     call emme -ng 000 -m ..\macros\2_initialize_networks.mac pm 1003 %highpnr%
     call emme -ng 000 -m ..\macros\3_read_inputs.mac pm 1003
)

call emme -ng 000 -m ..\macros\5_auto_assignment.mac %pm_iter% %brgap% %iternum% 1003 p
call emme -ng 000 -m ..\macros\8_calculate_total_vehicles.mac 1003

cd ..
echo "PM assignment finished" > donePM.ind
exit