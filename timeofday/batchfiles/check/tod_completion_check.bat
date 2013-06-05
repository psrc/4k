REM hb other
:CheckLoopHBOther
if exist doneHBOther.ind goto EndLoopHBOther
ping -n 31 127.0.0.1 >NUL
goto CheckLoopHBOther
:EndLoopHBOther
REM hb shop
:CheckLoopHBShop
if exist doneHBShop.ind goto EndLoopHBShop
ping -n 31 127.0.0.1 >NUL
goto CheckLoopHBShop
:EndLoopHBShop
REM hb work - hov
:CheckLoopHBWorkHOV
if exist doneHBWorkHOV.ind goto EndLoopHBWorkHOV
ping -n 31 127.0.0.1 >NUL
goto CheckLoopHBWorkHOV
:EndLoopHBWorkHOV
REM hb work - sov - income 1
:CheckLoopHBWorkSOV1
if exist doneHBWorkSOV1.ind goto EndLoopHBWorkSOV1
ping -n 31 127.0.0.1 >NUL
goto CheckLoopHBWorkSOV1
:EndLoopHBWorkSOV1
REM hb work - sov - income 2
:CheckLoopHBWorkSOV2
if exist doneHBWorkSOV2.ind goto EndLoopHBWorkSOV2
ping -n 31 127.0.0.1 >NUL
goto CheckLoopHBWorkSOV2
:EndLoopHBWorkSOV2
REM hb work - sov - income 3
:CheckLoopHBWorkSOV3
if exist doneHBWorkSOV3.ind goto EndLoopHBWorkSOV3
ping -n 31 127.0.0.1 >NUL
goto CheckLoopHBWorkSOV3
:EndLoopHBWorkSOV3
REM hb work - sov - income 4
:CheckLoopHBWorkSOV4
if exist doneHBWorkSOV4.ind goto EndLoopHBWorkSOV4
ping -n 31 127.0.0.1 >NUL
goto CheckLoopHBWorkSOV4
:EndLoopHBWorkSOV4
if exist tod_end.out erase tod_end.out
time /t >> tod_end.out