REM checks for emlock files in emmebank folders
REM auto assignments
cd assignments/auto/am
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
cd assignments/auto/md
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
cd assignments/auto/pm
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
cd assignments/auto/ev
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
cd assignments/auto/ni
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
REM non-motorized assignments
cd assignments/nonmotorized/am
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
REM transit assignments
cd assignments/transit/am/all_mode
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../../..
cd assignments/transit/md/all_mode
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../../..
REM distribution
cd distribution/all
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../..
REM mode choice
cd modechoice/hbcollege
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../..
cd modechoice/hbnonwork
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../..
cd modechoice/hbschool
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../..
cd modechoice/hbwork_inc1
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../..
cd modechoice/hbwork_inc2
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../..
cd modechoice/hbwork_inc3
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../..
cd modechoice/hbwork_inc4
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../..
cd modechoice/nhb
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../..
REM auto skims
cd skims/auto/am
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
cd skims/auto/md
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
cd skims/auto/pm
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
cd skims/auto/ev
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
cd skims/auto/ni
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
REM bidirectional skims
cd skims/bidirectional/distance
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
cd skims/bidirectional/time
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
cd skims/bidirectional/generalized_cost
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
REM intrazonal/terminal times
cd skims/iz_tt
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../..
REM non-motorized skims
cd skims/nonmotorized/am
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
REM park and ride skims
cd skims/pnr/income1
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
cd skims/pnr/income2
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
cd skims/pnr/income3
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
cd skims/pnr/income4
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
REM transit skims
cd skims/transit/am/all_mode
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../../..
cd skims/transit/md/all_mode
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../../..
REM time of day
cd timeofday/delay/allpurposes
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
cd timeofday/hbother/hov
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
cd timeofday/hbother/sov
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
cd timeofday/hbshop/hov
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
cd timeofday/hbshop/sov
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
cd timeofday/hbwork/hov
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
cd timeofday/hbwork/sov/income1
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../../..
cd timeofday/hbwork/sov/income2
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../../..
cd timeofday/hbwork/sov/income3
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../../..
cd timeofday/hbwork/sov/income4
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../../..
REM auto trip tables
cd triptables/autos/am
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
cd triptables/autos/md
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
cd triptables/autos/pm
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
cd triptables/autos/ev
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
cd triptables/autos/ni
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
REM non-motorized trip tables
cd triptables/nonmotorized/all
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
REM park and ride trip tables
cd triptables/parkandride/income1
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
cd triptables/parkandride/income2
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
cd triptables/parkandride/income3
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
cd triptables/parkandride/income4
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
REM transit walk-access trip tables
cd triptables/transit/walkaccess
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../../..
REM truck trip tables
cd triptables/trucks
if exist emlock* echo emlock file found, model run exited
if exist emlock* exit /b
cd ../..
