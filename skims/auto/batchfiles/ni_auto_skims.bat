REM Puget Sound 4k: Trip Based Model
REM Created November 2017
REM File created by PSRC staff
REM Batch file to initialize all the matrices and data needed for auto skims

cd ni

if %iternum% == 0 (
     call emme -ng 000 -m ..\macros\5_skim_network.mac n 1006
     call emme -ng 000 -m ..\macros\6_calculate_auto_skims.mac n
)

if %iternum% == 1 (
     call emme -ng 000 -m ..\macros\5_skim_network.mac n 1006
     call emme -ng 000 -m ..\macros\6_calculate_auto_skims.mac n
)

if %iternum% == 2 (
     call emme -ng 000 -m ..\macros\3_import_ni_scenario.mac n 1006
     call emme -ng 000 -m ..\macros\5_skim_network.mac n 1006
     call emme -ng 000 -m ..\macros\6_calculate_auto_skims.mac n
     call emme -ng 000 -m ..\macros\7_calculate_auto_feedback_skims.mac n
)

if %iternum% == 3 (
     call emme -ng 000 -m ..\macros\3_import_ni_scenario.mac n 1006
     call emme -ng 000 -m ..\macros\5_skim_network.mac n 1006
     call emme -ng 000 -m ..\macros\6_calculate_auto_skims.mac n
     call emme -ng 000 -m ..\macros\7_calculate_auto_feedback_skims.mac n
)

if %iternum% == 4 (
     call emme -ng 000 -m ..\macros\3_import_ni_scenario.mac n 1006
     call emme -ng 000 -m ..\macros\5_skim_network.mac n 1006
     call emme -ng 000 -m ..\macros\6_calculate_auto_skims.mac n
     call emme -ng 000 -m ..\macros\7_calculate_auto_feedback_skims.mac n
)

if %iternum% == 5 (
     call emme -ng 000 -m ..\macros\5_skim_network.mac n 1006
     call emme -ng 000 -m ..\macros\6_calculate_auto_skims.mac n
)

cd ..
echo "ni auto skims finished" > doneNI.ind
exit
