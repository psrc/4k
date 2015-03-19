REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM File created by PSRC staff
REM Batch file to delete files and create new banks

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
if exist emlock* erase emlock*
if exist usemacro* erase usemacro*
if exist d002* erase d002*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m %modeldir%\batchfiles\setup\create_databank.mac
call emme -ng 000 -m %modeldir%\batchfiles\setup\create_networks.mac %tod% %scen% %modeldir%
