cd AM
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM record start of secondary call
echo "AM assignment started at:" >> track1.rpt
time /t >> track1.rpt
REM call AM vehicle assignment macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_calculate_am_arterial_delay.mac 3700 3733 3750 3751 4000
call emme -ng --set-iks 127.0.0.1 000 -m Macros\8_am_auto_assignment.mac 200
REM record end of secondary call
echo "AM assignment ended at:" >> track1.rpt
time /t >> track1.rpt
cd ..
REM create new indicator file and end
echo "AM assignment finished at:" > doneAM.ind
time /t >> doneAM.ind
exit