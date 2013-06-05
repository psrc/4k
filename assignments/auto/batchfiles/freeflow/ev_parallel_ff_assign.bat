cd EV
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM record start of secondary call
echo "EV assignment started at:" >> track4.rpt
time /t >> track4.rpt
REM call EV vehicle assignment macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3_initialize_ev_vdfs.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\4_initialize_ev_extra_attributes.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\5_input_ev_tolls.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_calculate_ev_arterial_delay.mac 3700 3733 3750 3751 4000
call emme -ng --set-iks 127.0.0.1 000 -m Macros\8_ev_auto_assignment_freeflow.mac
REM record end of secondary call
echo "EV assignment ended at:" >> track4.rpt
time /t >> track4.rpt
cd ..
REM create new indicator file and end
echo "EV assignment finished at:" > doneEV.ind
time /t >> doneEV.ind
exit