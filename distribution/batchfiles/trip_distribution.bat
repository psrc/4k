cd all
call emme -ng 000 -m macros\1_initialize_matrices.mac
call emme -ng 000 -m macros\2_initialize_scalars.mac
call emme -ng 000 -m macros\3_initialize_full_matrices.mac
call emme -ng 000 -m macros\4_input_data.mac
call emme -ng 000 -m macros\5_balanced_refactored_atrractions.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\6_trip_distribution.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
cd ..
