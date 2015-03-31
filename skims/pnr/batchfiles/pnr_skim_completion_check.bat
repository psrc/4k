:CheckLoopInc1
if exist doneInc1_pnrskims.ind goto EndLoopInc1
ping -n 31 127.0.0.1 >NUL
goto CheckLoopInc1
:EndLoopInc1

:CheckLoopInc2
if exist doneInc2_pnrskims.ind goto EndLoopInc2
ping -n 31 127.0.0.1 >NUL
goto CheckLoopInc2
:EndLoopInc2

:CheckLoopInc3
if exist doneInc3_pnrskims.ind goto EndLoopInc3
ping -n 31 127.0.0.1 >NUL
goto CheckLoopInc3
:EndLoopInc3

:CheckLoopInc4
if exist doneInc4_pnrskims.ind goto EndLoopInc4
ping -n 31 127.0.0.1 >NUL
goto CheckLoopInc4
:EndLoopInc4