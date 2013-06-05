cd MD
REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM record start of secondary call
echo "MD assignment started at:" >> track2.rpt
time /t >> track2.rpt
REM call MD vehicle assignment macros
call emme -ng --set-iks 127.0.0.1 000 -m Macros\3_initialize_md_vdfs.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\4_initialize_md_extra_attributes.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\5_input_md_tolls.mac
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_calculate_md_arterial_delay.mac 3700 3733 3750 3751 4000
call emme -ng --set-iks 127.0.0.1 000 -m Macros\8_md_auto_assignment_freeflow.mac
REM record end of secondary call
echo "MD assignment ended at:" >> track2.rpt
time /t >> track2.rpt
cd ..
REM create new indicator file and end
echo "MD assignment finished at:" > doneMD.ind
time /t >> doneMD.ind
exit