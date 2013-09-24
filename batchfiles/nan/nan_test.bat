@echo off
echo.top >{ntest}.dat
for %%F in (*%1) do find /c /i "NaN" %%F | find /c ": 0" >>{ntest}.dat
find /c "0" {ntest}.dat >nul
if not errorlevel 1 exit /b 4
erase {ntest}.dat
exit /b 0
