cd ni
call emme -ng --set-iks 127.0.0.1 000 -m Macros\1_initialize_ni_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\1-9_initialize_ni_scalars.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\2_initialize_ni_full_matrices.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3_initialize_ni_vdfs.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\4_initialize_ni_extra_attributes.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\5_input_ni_tolls.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5-7_input_ni_vot_parameters.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\5-9_input_ni_triptables.mac
cd ..