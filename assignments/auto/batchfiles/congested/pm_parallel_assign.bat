cd pm
REM record start of secondary call
echo "pm assignment started at:" >> track3.rpt
time /t >> track3.rpt
REM call pm vehicle assignment macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_calculate_pm_arterial_delay.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m Macros\8_pm_auto_assignment.mac %assigniter%
call emme -ng --set-iks 127.0.0.1 000 -m Macros\9_calculate_total_vehicles.mac
REM record end of secondary call
echo "pm assignment ended at:" >> track3.rpt
time /t >> track3.rpt
cd ..
REM create new indicator file and end
echo "pm assignment finished at:" > donepm.ind
time /t >> donepm.ind
exit