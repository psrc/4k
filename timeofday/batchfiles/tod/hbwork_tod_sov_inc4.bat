cd hbwork\sov\income4
if exist track7.rpt erase track7.rpt
echo "HB WorkSOV4 Time of Day Model started at:" >> track7.rpt
time /t >> track7.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_hh_size.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_adjusted_delay.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_calculate_adjusted_bridge_flag.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_calculate_hbwork_inc4_sov_a-p_tod_shares.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_calculate_hbwork_inc4_sov_p-a_tod_shares.mac
REM record end of secondary call
echo "HB WorkSOV4 Time of Day Model ended at:" >> track7.rpt
time /t >> track7.rpt
cd ..\..\..
REM create new indicator file and end
echo "HB WorkSOV4 Time of Day Model finished at:" > doneHBWorkSOV4.ind
time /t >> doneHBWorkSOV4.ind
exit