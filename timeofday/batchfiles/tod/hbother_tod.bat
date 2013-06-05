cd hbother\hov
if exist track1.rpt erase track1.rpt
echo "HB Other Time of Day Model started at:" >> track1.rpt
time /t >> track1.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_hh_size.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_adjusted_delay.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_calculate_adjusted_bridge_flag.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_calculate_hbother_hov_a-p_tod_shares.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_calculate_hbother_hov_p-a_tod_shares.mac
cd ..
cd sov
if exist track1.rpt erase track1.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_hh_size.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_adjusted_delay.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_calculate_adjusted_bridge_flag.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_calculate_hbother_sov_a-p_tod_shares.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_calculate_hbother_sov_p-a_tod_shares.mac
REM record end of secondary call
echo "HB Other Time of Day Model ended at:" >> track1.rpt
time /t >> track1.rpt
cd ..\..
REM create new indicator file and end
echo "HB Other Time of Day Model finished at:" > doneHBOther.ind
time /t >> doneHBOther.ind
exit