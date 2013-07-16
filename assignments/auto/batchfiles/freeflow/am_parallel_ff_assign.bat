cd am
REM record start of secondary call
echo "am assignment started at:" >> track1.rpt
time /t >> track1.rpt
REM call am vehicle assignment macros
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_am_vdfs.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_am_extra_attributes.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_input_am_tolls.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5-7_input_am_vot_parameters.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5-8_input_bridge_flags.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_calculate_am_arterial_delay.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_am_auto_assignment_freeflow.mac %assigniter%
REM record end of secondary call
echo "am assignment ended at:" >> track1.rpt
time /t >> track1.rpt
cd ..
REM create new indicator file and end
echo "am assignment finished at:" > doneam.ind
time /t >> doneam.ind
exit