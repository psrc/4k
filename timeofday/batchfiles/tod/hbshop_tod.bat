cd hbshop\hov
if exist track2.rpt erase track2.rpt
echo "HB Shop Time of Day Model started at:" >> track2.rpt
time /t >> track2.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_hh_size.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_adjusted_delay.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_calculate_adjusted_bridge_flag.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_calculate_hbshop_hov_a-p_tod_shares.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_calculate_hbshop_hov_p-a_tod_shares.mac
cd ..
cd sov
if exist track2.rpt erase track2.rpt
call emme -ng --set-iks 127.0.0.1 000 -m macros\8_calculate_hh_size.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\9_calculate_adjusted_delay.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\10_calculate_adjusted_bridge_flag.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\11_calculate_hbshop_sov_a-p_tod_shares.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\12_calculate_hbshop_sov_p-a_tod_shares.mac
REM record end of secondary call
echo "HB Shop Time of Day Model ended at:" >> track2.rpt
time /t >> track2.rpt
cd ..\..
REM create new indicator file and end
echo "HB Shop Time of Day Model finished at:" > doneHBShop.ind
time /t >> doneHBShop.ind
exit