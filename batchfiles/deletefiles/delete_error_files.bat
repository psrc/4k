REM deletes error files from emmebank folders
REM auto assignments
cd assignments/auto/am
if exist errors erase errors
cd ../../..
cd assignments/auto/md
if exist errors erase errors
cd ../../..
cd assignments/auto/pm
if exist errors erase errors
cd ../../..
cd assignments/auto/ev
if exist errors erase errors
cd ../../..
cd assignments/auto/ni
if exist errors erase errors
cd ../../..
REM non-motorized assignments
cd assignments/nonmotorized/am
if exist errors erase errors
cd ../../..
REM transit assignments
cd assignments/transit/am/all_mode
if exist errors erase errors
cd ../../../..
cd assignments/transit/md/all_mode
if exist errors erase errors
cd ../../../..
REM distribution
cd distribution/hbcollege
if exist errors erase errors
cd ../..
cd distribution/hbother
if exist errors erase errors
cd ../..
cd distribution/hbschool
if exist errors erase errors
cd ../..
cd distribution/hbshop
if exist errors erase errors
cd ../..
cd distribution/hbwork_inc1
if exist errors erase errors
cd ../..
cd distribution/hbwork_inc2
if exist errors erase errors
cd ../..
cd distribution/hbwork_inc3
if exist errors erase errors
cd ../..
cd distribution/hbwork_inc4
if exist errors erase errors
cd ../..
cd distribution/nhbother
if exist errors erase errors
cd ../..
cd distribution/nhbwork
if exist errors erase errors
cd ../..
REM trip generation
cd generation/trip
if exist errors erase errors
cd ../..
REM market segmentation
cd marketsegmentation/nonwork
if exist errors erase errors
cd ../..
cd marketsegmentation/work
if exist errors erase errors
cd ../..
REM mode choice
cd modechoice/hbcollege
if exist errors erase errors
cd ../..
cd modechoice/hbnonwork
if exist errors erase errors
cd ../..
cd modechoice/hbschool
if exist errors erase errors
cd ../..
cd modechoice/hbwork_inc1
if exist errors erase errors
cd ../..
cd modechoice/hbwork_inc2
if exist errors erase errors
cd ../..
cd modechoice/hbwork_inc3
if exist errors erase errors
cd ../..
cd modechoice/hbwork_inc4
if exist errors erase errors
cd ../..
cd modechoice/nhb
if exist errors erase errors
cd ../..
REM networks
cd networks
if exist errors erase errors
cd ..
REM auto skims
cd skims/auto/am
if exist errors erase errors
cd ../../..
cd skims/auto/md
if exist errors erase errors
cd ../../..
cd skims/auto/pm
if exist errors erase errors
cd ../../..
cd skims/auto/ev
if exist errors erase errors
cd ../../..
cd skims/auto/ni
if exist errors erase errors
cd ../../..
REM bidirectional skims
cd skims/bidirectional/distance
if exist errors erase errors
cd ../../..
cd skims/bidirectional/time
if exist errors erase errors
cd ../../..
cd skims/bidirectional/generalized_cost
if exist errors erase errors
cd ../../..
REM estimation skims
cd skims/estimation/am
if exist errors erase errors
cd ../../..
cd skims/estimation/md
if exist errors erase errors
cd ../../..
REM intrazonal/terminal times
cd skims/iz_tt
if exist errors erase errors
cd ../..
REM non-motorized skims
cd skims/nonmotorized/am
if exist errors erase errors
cd ../../..
REM park and ride skims
cd skims/pnr/income1
if exist errors erase errors
cd ../../..
cd skims/pnr/income2
if exist errors erase errors
cd ../../..
cd skims/pnr/income3
if exist errors erase errors
cd ../../..
cd skims/pnr/income4
if exist errors erase errors
cd ../../..
REM transit skims
cd skims/transit/am/all_mode
if exist errors erase errors
cd ../../../..
cd skims/transit/md/all_mode
if exist errors erase errors
cd ../../../..
REM time of day
cd timeofday/delay/allpurposes
if exist errors erase errors
cd ../../..
cd timeofday/hbother/hov
if exist errors erase errors
cd ../../..
cd timeofday/hbother/sov
if exist errors erase errors
cd ../../..
cd timeofday/hbshop/hov
if exist errors erase errors
cd ../../..
cd timeofday/hbshop/sov
if exist errors erase errors
cd ../../..
cd timeofday/hbwork/hov
if exist errors erase errors
cd ../../..
cd timeofday/hbwork/sov/income1
if exist errors erase errors
cd ../../../..
cd timeofday/hbwork/sov/income2
if exist errors erase errors
cd ../../../..
cd timeofday/hbwork/sov/income3
if exist errors erase errors
cd ../../../..
cd timeofday/hbwork/sov/income4
if exist errors erase errors
cd ../../../..
REM auto trip tables
cd triptables/autos/am
if exist errors erase errors
cd ../../..
cd triptables/autos/md
if exist errors erase errors
cd ../../..
cd triptables/autos/pm
if exist errors erase errors
cd ../../..
cd triptables/autos/ev
if exist errors erase errors
cd ../../..
cd triptables/autos/ni
if exist errors erase errors
cd ../../..
REM non-motorized trip tables
cd triptables/nonmotorized/all
if exist errors erase errors
cd ../../..
REM park and ride trip tables
cd triptables/parkandride/income1
if exist errors erase errors
cd ../../..
cd triptables/parkandride/income2
if exist errors erase errors
cd ../../..
cd triptables/parkandride/income3
if exist errors erase errors
cd ../../..
cd triptables/parkandride/income4
if exist errors erase errors
cd ../../..
REM transit walk-access trip tables
cd triptables/transit/walkaccess
if exist errors erase errors
cd ../../..
REM truck trip tables
cd triptables/trucks
if exist errors erase errors
cd ../..
REM truck model
cd trucks/distribution
if exist errors erase errors
cd ../..
cd trucks/generation
if exist errors erase errors
cd ../..
REM vehicle availability
cd vehicleavailability/all
if exist errors erase errors
cd ../..