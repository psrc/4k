cd md
REM record start of secondary call
echo "md assignment started at:" >> track2.rpt
time /t >> track2.rpt
REM call md vehicle assignment macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_calculate_md_arterial_delay.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m Macros\8_md_auto_assignment.mac %assigniter%
REM record end of secondary call
echo "md assignment ended at:" >> track2.rpt
time /t >> track2.rpt
cd ..
REM create new indicator file and end
echo "md assignment finished at:" > donemd.ind
time /t >> donemd.ind
exit