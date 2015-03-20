REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM File created by PSRC staff
REM Runs the AM Auto, Transit and Walk and Bike Assignments
REM Only copies in trip tables for iteration >0
REM Utilizes warm starts for all iterations
if exist *.ind erase *.ind

if %iternum% GTR 0 (
     cd am
	 call emme -ng 000 -m macros\11_input_triptables.mac
	 cd ..
	 cd md
	 call emme -ng 000 -m macros\11_input_triptables.mac
	 cd ..
	 cd pm
	 call emme -ng 000 -m macros\11_input_triptables.mac
	 cd ..
	 cd ev
	 call emme -ng 000 -m macros\11_input_triptables.mac
	 cd ..
	 cd ni
	 call emme -ng 000 -m macros\11_input_triptables.mac
	 cd ..
)

REM Run the Assignments in Parallel for the 5 time periods
start batchfiles\am.bat
start batchfiles\md.bat
start batchfiles\pm.bat
start batchfiles\ev.bat
start batchfiles\ni.bat