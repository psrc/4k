:CheckLoopHBOther
if exist doneHBOther.ind goto EndLoopHBOther
ping -n 31 127.0.0.1 >NUL
goto CheckLoopHBOther
:EndLoopHBOther

:CheckLoopHBShop
if exist doneHBShop.ind goto EndLoopHBShop
ping -n 31 127.0.0.1 >NUL
goto CheckLoopHBShop
:EndLoopHBShop

:CheckLoopHBWorkHOV
if exist doneHBWorkHOV.ind goto EndLoopHBWorkHOV
ping -n 31 127.0.0.1 >NUL
goto CheckLoopHBWorkHOV
:EndLoopHBWorkHOV

:CheckLoopHBWorkSOV1
if exist doneHBWorkSOV1.ind goto EndLoopHBWorkSOV1
ping -n 31 127.0.0.1 >NUL
goto CheckLoopHBWorkSOV1
:EndLoopHBWorkSOV1

:CheckLoopHBWorkSOV2
if exist doneHBWorkSOV2.ind goto EndLoopHBWorkSOV2
ping -n 31 127.0.0.1 >NUL
goto CheckLoopHBWorkSOV2
:EndLoopHBWorkSOV2

:CheckLoopHBWorkSOV3
if exist doneHBWorkSOV3.ind goto EndLoopHBWorkSOV3
ping -n 31 127.0.0.1 >NUL
goto CheckLoopHBWorkSOV3
:EndLoopHBWorkSOV3

:CheckLoopHBWorkSOV4
if exist doneHBWorkSOV4.ind goto EndLoopHBWorkSOV4
ping -n 31 127.0.0.1 >NUL
goto CheckLoopHBWorkSOV4
:EndLoopHBWorkSOV4
