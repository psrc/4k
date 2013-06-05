cd hbwork\hov
if exist track3.rpt erase track3.rpt
echo "HB WorkHOV Time of Day Model started at:" >> track3.rpt
time /t >> track3.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_hh_size.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_adjusted_delay.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_calculate_adjusted_bridge_flag.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_calculate_hbwork_hov_a-p_tod_shares.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_calculate_hbwork_hov_p-a_tod_shares.mac
REM record end of secondary call
echo "HB WorkHOV Time of Day Model ended at:" >> track3.rpt
time /t >> track3.rpt
cd ..\..
REM create new indicator file and end
echo "HB WorkHOV Time of Day Model finished at:" > doneHBWorkHOV.ind
time /t >> doneHBWorkHOV.ind
exit