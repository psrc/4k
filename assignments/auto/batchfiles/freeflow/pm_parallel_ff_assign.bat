cd pm
REM record start of secondary call
echo "pm assignment started at:" >> track3.rpt
time /t >> track3.rpt
REM call pm vehicle assignment macros
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_initialize_pm_vdfs.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\4_initialize_pm_extra_attributes.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5_input_pm_tolls.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\5-7_input_pm_vot_parameters.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\6_calculate_pm_arterial_delay.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_pm_auto_assignment_freeflow.mac %assigniter%
REM record end of secondary call
echo "pm assignment ended at:" >> track3.rpt
time /t >> track3.rpt
cd ..
REM create new indicator file and end
echo "pm assignment finished at:" > donepm.ind
time /t >> donepm.ind
exit