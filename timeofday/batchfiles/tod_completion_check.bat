REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM Created by PSRC staff
REM Checks for the indicator files to know if the model can resume

:CheckLoopSOV
if exist doneSOV.ind goto EndLoopSOV
ping -n 31 127.0.0.1 >NUL
goto CheckLoopSOV
:EndLoopSOV

:CheckLoopHOV
if exist doneHOV.ind goto EndLoopHOV
ping -n 31 127.0.0.1 >NUL
goto CheckLoopHOV
:EndLoopHOV
