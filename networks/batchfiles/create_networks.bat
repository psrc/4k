REM delete existing *.rpt, errors, and reports files
if exist *.rpt erase *.rpt
if exist errors erase errors
if exist reports erase reports
REM call create networks macros
call emme -ng --set-iks 127.0.0.1 000 -m macros\1_create_networks.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\2_input_fixes.mac
call emme -ng --set-iks 127.0.0.1 000 -m macros\3_output_centroids.mac