REM deletes *.ind (indicator) files from all folders
REM root folder
if exist *.ind erase *.ind
REM auto assignments
cd assignments/auto
if exist *.ind erase *.ind
cd ../..
REM auto skims
cd skims/auto
if exist *.ind erase *.ind
cd ../..
REM park and ride skims
cd skims/pnr
if exist *.ind erase *.ind
cd ../..
REM time of day
cd timeofday
if exist *.ind erase *.ind
cd ..
REM trip tables
cd triptables/autos
if exist *.ind erase *.ind
cd ../..
REM trip tables
cd triptables/parkandride
if exist *.ind erase *.ind
cd ../..
