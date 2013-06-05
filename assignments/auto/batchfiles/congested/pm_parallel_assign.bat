cd PM
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM record start of secondary call
echo "PM assignment started at:" >> track3.rpt
time /t >> track3.rpt
REM call PM vehicle assignment macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_calculate_pm_arterial_delay.mac 3700 3733 3750 3751 4000
call emme -ng --set-iks 127.0.0.1 000 -m Macros\8_pm_auto_assignment.mac 200
REM record end of secondary call
echo "PM assignment ended at:" >> track3.rpt
time /t >> track3.rpt
cd ..
REM create new indicator file and end
echo "PM assignment finished at:" > donePM.ind
time /t >> donePM.ind
exit