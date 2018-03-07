cd all
call emme -ng 000 -m macros\1_initialize_matrices.mac
call emme -ng 000 -m macros\2_input_data.mac %LUYear%
call emme -ng 000 -m macros\3_trip_distribution.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
cd ..
