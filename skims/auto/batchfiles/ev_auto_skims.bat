REM Puget Sound 4k: Trip Based Model
REM Created November 2017
REM File created by PSRC staff
REM Batch file to initialize all the matrices and data needed for auto skims

cd ev

if %iternum% == 0 (
     call emme -ng 000 -m ..\macros\5_skim_network.mac e 1005
     call emme -ng 000 -m ..\macros\6_calculate_auto_skims.mac e
)

if %iternum% == 1 (
     call emme -ng 000 -m ..\macros\5_skim_network.mac e 1005
     call emme -ng 000 -m ..\macros\6_calculate_auto_skims.mac e
)

if %iternum% == 2 (
     call emme -ng 000 -m ..\macros\3_import_ev_scenario.mac e 1005
     call emme -ng 000 -m ..\macros\5_skim_network.mac e 1005
     call emme -ng 000 -m ..\macros\6_calculate_auto_skims.mac e
     call emme -ng 000 -m ..\macros\7_calculate_auto_feedback_skims.mac e
)

if %iternum% == 3 (
     call emme -ng 000 -m ..\macros\3_import_ev_scenario.mac e 1005
     call emme -ng 000 -m ..\macros\5_skim_network.mac e 1005
     call emme -ng 000 -m ..\macros\6_calculate_auto_skims.mac e
     call emme -ng 000 -m ..\macros\7_calculate_auto_feedback_skims.mac e
)

if %iternum% == 4 (
     call emme -ng 000 -m ..\macros\3_import_ev_scenario.mac e 1005
     call emme -ng 000 -m ..\macros\5_skim_network.mac e 1005
     call emme -ng 000 -m ..\macros\6_calculate_auto_skims.mac e
     call emme -ng 000 -m ..\macros\7_calculate_auto_feedback_skims.mac e
)

if %iternum% == 5 (
     call emme -ng 000 -m ..\macros\5_skim_network.mac e 1005
     call emme -ng 000 -m ..\macros\6_calculate_auto_skims.mac e
)

cd ..
echo "ev auto skims finished" > doneEV.ind
exit
