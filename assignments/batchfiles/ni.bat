REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM File created by PSRC staff
REM Batch file to initialize all the matrices and data needed for auto assignments
REM Runs the NI Auto Assignments
REM Only copies in trip tables for iteration >0
REM Utilizes warm starts for all iterations

cd ni
if %iternum% == 0 (
     call emme -ng 000 -m macros\1_initialize_matrices.mac
	 call emme -ng 000 -m macros\2_initialize_scalars.mac
     call emme -ng 000 -m macros\3_initialize_full_matrices.mac
     call emme -ng 000 -m macros\4_initialize_vdfs.mac
     call emme -ng 000 -m macros\5_initialize_extra_attributes.mac
     call emme -ng 000 -m macros\6_input_tolls.mac
     call emme -ng 000 -m macros\7_input_vot_parameters.mac
     call emme -ng 000 -m macros\8_input_bridge_flags.mac
     call emme -ng 000 -m macros\9_calculate_arterial_delay.mac
)

call emme -ng 000 -m macros\12_auto_assignment.mac %assigniter% %brgap% %iternum%
call emme -ng 000 -m macros\13_calculate_total_vehicles.mac

cd ..
echo "NI assignment finished" > doneNI.ind
exit