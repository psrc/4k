cd hbwork\sov\income3
echo "HB WorkSOV3 Time of Day Model started at:" >> track6.rpt
time /t >> track6.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_hh_size.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_adjusted_delay.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_calculate_adjusted_bridge_flag.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_calculate_hbwork_inc3_sov_a-p_tod_shares.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_calculate_hbwork_inc3_sov_p-a_tod_shares.mac
REM record end of secondary call
echo "HB WorkSOV3 Time of Day Model ended at:" >> track6.rpt
time /t >> track6.rpt
cd ..\..\..
REM create new indicator file and end
echo "HB WorkSOV3 Time of Day Model finished at:" > doneHBWorkSOV3.ind
time /t >> doneHBWorkSOV3.ind
exit