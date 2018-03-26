REM checks for Nan in emmebank Files

set modeldir=%cd%
FOR /F "tokens=*" %%A IN (%cd%%\batchfiles\setup\assignment_bank_list.txt) DO (
cd %modeldir%\%%A
@call %cd%%\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
)

cd %modeldir%
FOR /F "tokens=*" %%A IN (%cd%%\batchfiles\setup\other_bank_list.txt) DO (
cd %modeldir%\%%A
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
)

cd %modeldir%
