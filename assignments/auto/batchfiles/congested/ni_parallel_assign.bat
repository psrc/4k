cd ni
REM record start of secondary call
echo "ni assignment started at:" >> track5.rpt
time /t >> track5.rpt
REM call ni vehicle assignment macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_calculate_ni_arterial_delay.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m Macros\8_ni_auto_assignment.mac %assigniter%
REM record end of secondary call
echo "ni assignment ended at:" >> track5.rpt
time /t >> track5.rpt
cd ..
REM create new indicator file and end
echo "ni assignment finished at:" > doneni.ind
time /t >> doneni.ind
exit