cd am
REM record start of secondary call
echo "am assignment started at:" >> track1.rpt
time /t >> track1.rpt
REM call am vehicle assignment macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_calculate_am_arterial_delay.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m Macros\8_am_auto_assignment.mac %assigniter%
REM record end of secondary call
echo "am assignment ended at:" >> track1.rpt
time /t >> track1.rpt
cd ..
REM create new indicator file and end
echo "am assignment finished at:" > doneam.ind
time /t >> doneam.ind
exit