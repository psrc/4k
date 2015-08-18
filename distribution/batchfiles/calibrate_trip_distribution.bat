cd all
call emme -ng 000 -m macros\1_initialize_matrices.mac
call emme -ng 000 -m macros\2_initialize_scalars.mac
call emme -ng 000 -m macros\3b_initialize_full_matrices_calibrate.mac
call emme -ng 000 -m macros\4_input_data.mac
call emme -ng 000 -m macros\calibrate_distribution.mac
cd ..
