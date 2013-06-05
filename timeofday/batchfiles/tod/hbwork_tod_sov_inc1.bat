cd hbwork\sov\income1
if exist track4.rpt erase track4.rpt
echo "HB WorkSOV1 Time of Day Model started at:" >> track4.rpt
time /t >> track4.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_hh_size.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_adjusted_delay.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_calculate_adjusted_bridge_flag.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_calculate_hbwork_inc1_sov_a-p_tod_shares.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_calculate_hbwork_inc1_sov_p-a_tod_shares.mac
REM record end of secondary call
echo "HB WorkSOV1 Time of Day Model ended at:" >> track4.rpt
time /t >> track4.rpt
cd ..\..\..
REM create new indicator file and end
echo "HB WorkSOV1 Time of Day Model finished at:" > doneHBWorkSOV1.ind
time /t >> doneHBWorkSOV1.ind
exit