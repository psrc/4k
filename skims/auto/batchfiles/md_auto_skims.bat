REM Puget Sound 4k: Trip Based Model
REM Created November 2017
REM File created by PSRC staff
REM Batch file to initialize all the matrices and data needed for auto skims

cd md

if %iternum% == 0 (
     call emme -ng 000 -m ..\macros\5_skim_network.mac m 1004
     call emme -ng 000 -m ..\macros\6_calculate_auto_skims.mac m
)

if %iternum% == 1 (
     call emme -ng 000 -m ..\macros\5_skim_network.mac m 1004
     call emme -ng 000 -m ..\macros\6_calculate_auto_skims.mac m
)

if %iternum% == 2 (
     call emme -ng 000 -m ..\macros\3_import_md_scenario.mac m 1004
     call emme -ng 000 -m ..\macros\5_skim_network.mac m 1004
     call emme -ng 000 -m ..\macros\6_calculate_auto_skims.mac m
     call emme -ng 000 -m ..\macros\7_calculate_auto_feedback_skims.mac m
)

if %iternum% == 3 (
     call emme -ng 000 -m ..\macros\3_import_md_scenario.mac m 1004
     call emme -ng 000 -m ..\macros\5_skim_network.mac m 1004
     call emme -ng 000 -m ..\macros\6_calculate_auto_skims.mac m
     call emme -ng 000 -m ..\macros\7_calculate_auto_feedback_skims.mac m
)

if %iternum% == 4 (
     call emme -ng 000 -m ..\macros\3_import_md_scenario.mac m 1004
     call emme -ng 000 -m ..\macros\5_skim_network.mac m 1004
     call emme -ng 000 -m ..\macros\6_calculate_auto_skims.mac m
     call emme -ng 000 -m ..\macros\7_calculate_auto_feedback_skims.mac m
)

if %iternum% == 5 (
     call emme -ng 000 -m ..\macros\5_skim_network.mac m 1004
     call emme -ng 000 -m ..\macros\6_calculate_auto_skims.mac m
)

cd ..
echo "md auto skims finished" > doneMD.ind
exit
