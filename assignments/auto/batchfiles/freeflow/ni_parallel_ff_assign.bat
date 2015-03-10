cd ni
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_ni_vdfs.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_ni_extra_attributes.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_input_ni_tolls.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\5-7_input_ni_vot_parameters.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_calculate_ni_arterial_delay.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_ni_auto_assignment_freeflow.mac %assigniter% %brgap%
cd ..
echo "ni assignment finished" > doneni.ind
exit