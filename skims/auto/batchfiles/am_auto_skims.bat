REM Puget Sound 4k: Trip Based Model
REM Created November 2017
REM File created by PSRC staff
REM Batch file to initialize all the matrices and data needed for auto skims

cd am

if %iternum% == 0 (
     call emme -ng 000 -m ..\macros\5_skim_network.mac a 1002
     call emme -ng 000 -m ..\macros\6_calculate_auto_skims.mac a
)

if %iternum% == 1 (
     call emme -ng 000 -m ..\macros\5_skim_network.mac a 1002
     call emme -ng 000 -m ..\macros\6_calculate_auto_skims.mac a
)

if %iternum% == 2 (
     call emme -ng 000 -m ..\macros\5_skim_network.mac a 1002
     call emme -ng 000 -m ..\macros\6_calculate_auto_skims.mac a
     call emme -ng 000 -m ..\macros\7_calculate_auto_feedback_skims.mac a
)

if %iternum% == 3 (
     call emme -ng 000 -m ..\macros\5_skim_network.mac a 1002
     call emme -ng 000 -m ..\macros\6_calculate_auto_skims.mac a
     call emme -ng 000 -m ..\macros\7_calculate_auto_feedback_skims.mac a
)

if %iternum% == 4 (
     call emme -ng 000 -m ..\macros\5_skim_network.mac a 1002
     call emme -ng 000 -m ..\macros\6_calculate_auto_skims.mac a
     call emme -ng 000 -m ..\macros\7_calculate_auto_feedback_skims.mac a
)

if %iternum% == 5 (
     call emme -ng 000 -m ..\macros\5_skim_network.mac a 1002
     call emme -ng 000 -m ..\macros\6_calculate_auto_skims.mac a
)

cd ..
echo "am auto skims finished" > doneAM.ind
exit
