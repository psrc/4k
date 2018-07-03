:CheckLoopAM
if exist doneAM.ind goto EndLoopAM
ping -n 31 127.0.0.1 >NUL
goto CheckLoopAM
:EndLoopAM

:CheckLoopMD
if exist doneMD.ind goto EndLoopMD
ping -n 31 127.0.0.1 >NUL
goto CheckLoopMD
:EndLoopMD

:CheckLoopPM
if exist donePM.ind goto EndLoopPM
ping -n 31 127.0.0.1 >NUL
goto CheckLoopPM
:EndLoopPM

:CheckLoopEV
if exist doneEV.ind goto EndLoopEV
ping -n 31 127.0.0.1 >NUL
goto CheckLoopEV
:EndLoopEV

:CheckLoopNI
if exist doneNI.ind goto EndLoopNI
ping -n 31 127.0.0.1 >NUL
goto CheckLoopNI
:EndLoopNI
