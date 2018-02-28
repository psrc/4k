REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM File created by PSRC staff
REM Batch file to create all necessary databanks
REM Also runs free-flow assignments and skims

REM Creates all the databanks
set modeldir=%cd%
FOR /F "tokens=*" %%A IN (%cd%%\batchfiles\setup\assignment_bank_list.txt) DO (
cd %modeldir%\%%A
if %modeldir%\%%A == %modeldir%\assignments\am (
    set tod=AM
	set scen=1002
	call %cd%\batchfiles\setup\network_bank_initialization.bat
)
if %modeldir%\%%A == %modeldir%\assignments\md (
    set tod=MD
	set scen=1004
	call %modeldir%\batchfiles\setup\network_bank_initialization.bat
)
if %modeldir%\%%A == %modeldir%\assignments\pm (
    set tod=PM
	set scen=1003
	call %modeldir%\batchfiles\setup\network_bank_initialization.bat
)
if %modeldir%\%%A == %modeldir%\assignments\ev (
    set tod=EV
	set scen=1005
	call %modeldir%\batchfiles\setup\network_bank_initialization.bat
)
if %modeldir%\%%A == %modeldir%\assignments\ni (
    set tod=NI
	set scen=1006
	call %modeldir%\batchfiles\setup\network_bank_initialization.bat
)
REM End the Assignment Bank Initialization
)
REM For all other Banks it will be a centroid only network
cd %modeldir%
FOR /F "tokens=*" %%A IN (%cd%%\batchfiles\setup\other_bank_list.txt) DO (
cd %modeldir%\%%A
set tod=All
set scen=9999
call %cd%\batchfiles\setup\network_bank_initialization.bat
)

cd %modeldir%
echo Matrix Setup completed on %date% at %time%. >> psrc_4k_log.txt

REM Assignments
cd assignments
call batchfiles\parallel_assignment.bat
call batchfiles\assignment_completion_check.bat
cd ..
echo Free-Flow Assignments completed on %date% at %time%. >> psrc_4k_log.txt

REM Calculate Intrazonal Skims
cd skims\iz_tt
call batchfiles\iz_tt_skims.bat
cd ..\..
echo Free-Flow Intrazonal Skims completed on %date% at %time%. >> psrc_4k_log.txt

REM Calculate Auto Skims
cd skims\auto
call batchfiles\auto_skims.bat
call batchfiles\auto_skim_completion_check.bat
cd ..\..
echo Free-Flow Auto Skims completed on %date% at %time%. >> psrc_4k_log.txt

REM Calculate Bi-Directional Skims
cd skims\bidirectional
call batchfiles\bidirectional_skims.bat
cd ..\..
echo Free-Flow Bi-Directional Skims completed on %date% at %time%. >> psrc_4k_log.txt

REM Calculate Transit Skims
cd skims\transit
call batchfiles\basic\basic_transit_skims.bat
cd ..\..
echo Free-Flow Transit Skims completed on %date% at %time%. >> psrc_4k_log.txt

REM Calculate Walk and Bike Skims
cd skims\nonmotorized
call batchfiles\am_non_motorized_skims.bat
cd ..\..
echo Free-Flow Walk and Bike Skims completed on %date% at %time%. >> psrc_4k_log.txt

REM Calculate Park and Ride Skims
cd skims\pnr
call batchfiles\pnr_skims.bat
call batchfiles\pnr_skim_completion_check.bat
cd ..\..
echo Free-Flow Park and Ride Skims completed on %date% at %time%. >> psrc_4k_log.txt
