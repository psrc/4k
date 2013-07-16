cd md
REM record start of secondary call
echo "md assignment started at:" >> track2.rpt
time /t >> track2.rpt
REM call md vehicle assignment macros
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_md_vdfs.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_md_extra_attributes.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_input_md_tolls.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5-7_input_md_vot_parameters.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_calculate_md_arterial_delay.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_md_auto_assignment_freeflow.mac %assigniter%
REM record end of secondary call
echo "md assignment ended at:" >> track2.rpt
time /t >> track2.rpt
cd ..
REM create new indicator file and end
echo "md assignment finished at:" > donemd.ind
time /t >> donemd.ind
exit