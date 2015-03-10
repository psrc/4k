cd pm
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_pm_vdfs.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_pm_extra_attributes.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_input_pm_tolls.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\5-7_input_pm_vot_parameters.mac %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_calculate_pm_arterial_delay.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_pm_auto_assignment_freeflow.mac %assigniter% %brgap%
cd ..
echo "pm assignment finished" > donepm.ind
exit