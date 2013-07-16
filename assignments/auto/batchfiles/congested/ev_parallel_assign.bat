cd ev
REM record start of secondary call
echo "ev assignment started at:" >> track4.rpt
time /t >> track4.rpt
REM call ev vehicle assignment macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_calculate_ev_arterial_delay.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m Macros\8_ev_auto_assignment.mac %assigniter%
REM record end of secondary call
echo "ev assignment ended at:" >> track4.rpt
time /t >> track4.rpt
cd ..
REM create new indicator file and end
echo "ev assignment finished at:" > doneev.ind
time /t >> doneev.ind
exit