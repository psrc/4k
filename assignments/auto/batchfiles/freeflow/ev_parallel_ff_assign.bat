cd ev
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_ev_vdfs.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_ev_extra_attributes.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_input_ev_tolls.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\5-7_input_ev_vot_parameters.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_calculate_ev_arterial_delay.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_ev_auto_assignment_freeflow.mac %assigniter% %brgap%
cd ..
echo "ev assignment finished" > doneev.ind
exit