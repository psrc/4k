cd am
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_am_vdfs.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_am_extra_attributes.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_input_am_tolls.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\5-7_input_am_vot_parameters.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\5-8_input_bridge_flags.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_calculate_am_arterial_delay.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_am_auto_assignment_freeflow.mac %assigniter% %brgap%
cd ..
echo "am assignment finished" > doneam.ind
exit