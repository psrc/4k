REM Puget Sound 4k: Trip Based Model
REM Updated June 2015
REM Created by PSRC staff
REM Model Runs with 4 Global Internal Iterations and a Final set of Assignments and Skims

REM Parameters are passed to the Batch File via the Control File "4k.ctl"
for /f "tokens=1,2 delims==" %%a in (4k.ctl) do SET %%a=%%b

set modeldir=%cd%

REM Remove Databanks if called for in the control file
if %DeleteBank% == Yes (
     set modeldir=%cd%
	 FOR /F "tokens=*" %%A IN (%cd%%\batchfiles\setup\assignment_bank_list.txt) DO (
	 cd %modeldir%\%%A

	 REM Delete the Existing Files if present
     if exist emmebank erase emmebank
     if exist %modeldir%\%%A\emmemat rmdir %modeldir%\%%A\emmemat /s /q
     if exist PATHS* erase PATHS*
     if exist errors erase errors
	 if exist usemacro* erase usemacro*
     if exist *in erase *in
	 )
	 
	 cd %modeldir%
	 FOR /F "tokens=*" %%A IN (%cd%%\batchfiles\setup\other_bank_list.txt) DO (
	 cd %modeldir%\%%A
     if exist emmebank erase emmebank
     if exist %modeldir%\%%A\emmemat rmdir %modeldir%\%%A\emmemat /s /q
     if exist PATHS* erase PATHS*
     if exist errors erase errors
	 if exist usemacro* erase usemacro*
     if exist *in erase *in
	 )
)
cd %modeldir%

REM Remove Internal Report Files if called for in the control file
if %DeleteReports% == Yes (
     set modeldir=%cd%
	 FOR /F "tokens=*" %%A IN (%cd%%\batchfiles\setup\assignment_bank_list.txt) DO (
	 cd %modeldir%\%%A

	 REM Delete the Existing Files if present
     if exist *.rp* erase *.rp*
	 )
	 
	 cd %modeldir%
	 FOR /F "tokens=*" %%A IN (%cd%%\batchfiles\setup\other_bank_list.txt) DO (
	 cd %modeldir%\%%A
     if exist *.rp* erase *.rp*
	 )
)
cd %modeldir%