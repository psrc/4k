cd hbwork\sov\income2
if exist track5.rpt erase track5.rpt
echo "HB WorkSOV2 Time of Day Model started at:" >> track5.rpt
time /t >> track5.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_hh_size.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_adjusted_delay.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_calculate_adjusted_bridge_flag.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_calculate_hbwork_inc2_sov_a-p_tod_shares.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_calculate_hbwork_inc2_sov_p-a_tod_shares.mac
REM record end of secondary call
echo "HB WorkSOV2 Time of Day Model ended at:" >> track5.rpt
time /t >> track5.rpt
cd ..\..\..
REM create new indicator file and end
echo "HB WorkSOV2 Time of Day Model finished at:" > doneHBWorkSOV2.ind
time /t >> doneHBWorkSOV2.ind
exit