cd ni
REM record start of secondary call
echo "ni assignment started at:" >> track5.rpt
time /t >> track5.rpt
REM call ni vehicle assignment macros
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_ni_vdfs.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_ni_extra_attributes.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_input_ni_tolls.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5-7_input_ni_vot_parameters.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_calculate_ni_arterial_delay.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_ni_auto_assignment_freeflow.mac %assigniter%
REM record end of secondary call
echo "ni assignment ended at:" >> track5.rpt
time /t >> track5.rpt
cd ..
REM create new indicator file and end
echo "ni assignment finished at:" > doneni.ind
time /t >> doneni.ind
exit