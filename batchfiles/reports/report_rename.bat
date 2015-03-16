REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM File created by PSRC staff
REM Batch file to rename reports after each iteration

set modeldir=%cd%
FOR /F "tokens=*" %%A IN (%cd%%\batchfiles\setup\assignment_bank_list.txt) DO (
cd %modeldir%\%%A
ren *.rpt *.rp%1%
)

cd %modeldir%
FOR /F "tokens=*" %%A IN (%cd%%\batchfiles\setup\other_bank_list.txt) DO (
cd %modeldir%\%%A
ren *.rpt *.rp%1%
)

cd %modeldir%
