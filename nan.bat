for /f "tokens=1,2 delims==" %%a in (4k.ctl) do SET %%a=%%b
set modeldir=%cd%
call batchfiles\nan\nan_check.bat
