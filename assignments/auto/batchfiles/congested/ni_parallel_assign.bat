cd NI
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM record start of secondary call
echo "NI assignment started at:" >> track5.rpt
time /t >> track5.rpt
REM call NI vehicle assignment macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_calculate_ni_arterial_delay.mac 3700 3733 3750 3751 4000
call emme -ng --set-iks 127.0.0.1 000 -m Macros\8_ni_auto_assignment.mac 200
REM record end of secondary call
echo "NI assignment ended at:" >> track5.rpt
time /t >> track5.rpt
cd ..
REM create new indicator file and end
echo "NI assignment finished at:" > doneNI.ind
time /t >> doneNI.ind
exit