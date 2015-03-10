cd md
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_md_vdfs.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_md_extra_attributes.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_input_md_tolls.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\5-7_input_md_vot_parameters.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_calculate_md_arterial_delay.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_md_auto_assignment_freeflow.mac %assigniter% %brgap%
cd ..
echo "md assignment finished" > donemd.ind
exit