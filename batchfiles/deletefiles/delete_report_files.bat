REM deletes *.rp* (report) files from all folders
REM auto assignments
cd assignments/auto/am
if exist *.rp* erase *.rp*
cd ../../..
cd assignments/auto/md
if exist *.rp* erase *.rp*
cd ../../..
cd assignments/auto/pm
if exist *.rp* erase *.rp*
cd ../../..
cd assignments/auto/ev
if exist *.rp* erase *.rp*
cd ../../..
cd assignments/auto/ni
if exist *.rp* erase *.rp*
cd ../../..
REM non-motorized assignments
cd assignments/nonmotorized/am
if exist *.rp* erase *.rp*
cd ../../..
REM transit assignments
cd assignments/transit/am/all_mode
if exist *.rp* erase *.rp*
cd ../../../..
cd assignments/transit/md/all_mode
if exist *.rp* erase *.rp*
cd ../../../..
REM distribution
cd distribution/hbcollege
if exist *.rp* erase *.rp*
cd ../..
cd distribution/hbother
if exist *.rp* erase *.rp*
cd ../..
cd distribution/hbschool
if exist *.rp* erase *.rp*
cd ../..
cd distribution/hbshop
if exist *.rp* erase *.rp*
cd ../..
cd distribution/hbwork_inc1
if exist *.rp* erase *.rp*
cd ../..
cd distribution/hbwork_inc2
if exist *.rp* erase *.rp*
cd ../..
cd distribution/hbwork_inc3
if exist *.rp* erase *.rp*
cd ../..
cd distribution/hbwork_inc4
if exist *.rp* erase *.rp*
cd ../..
cd distribution/nhbother
if exist *.rp* erase *.rp*
cd ../..
cd distribution/nhbwork
if exist *.rp* erase *.rp*
cd ../..
REM trip generation
cd generation/trip
if exist *.rp* erase *.rp*
cd ../..
REM market segmentation
cd marketsegmentation/nonwork
if exist *.rp* erase *.rp*
cd ../..
cd marketsegmentation/work
if exist *.rp* erase *.rp*
cd ../..
REM mode choice
cd modechoice/hbcollege
if exist *.rp* erase *.rp*
cd ../..
cd modechoice/hbnonwork
if exist *.rp* erase *.rp*
cd ../..
cd modechoice/hbschool
if exist *.rp* erase *.rp*
cd ../..
cd modechoice/hbwork_inc1
if exist *.rp* erase *.rp*
cd ../..
cd modechoice/hbwork_inc2
if exist *.rp* erase *.rp*
cd ../..
cd modechoice/hbwork_inc3
if exist *.rp* erase *.rp*
cd ../..
cd modechoice/hbwork_inc4
if exist *.rp* erase *.rp*
cd ../..
cd modechoice/nhb
if exist *.rp* erase *.rp*
cd ../..
REM networks
cd networks
if exist *.rp* erase *.rp*
cd ..
REM auto skims
cd skims/auto/am
if exist *.rp* erase *.rp*
cd ../../..
cd skims/auto/md
if exist *.rp* erase *.rp*
cd ../../..
cd skims/auto/pm
if exist *.rp* erase *.rp*
cd ../../..
cd skims/auto/ev
if exist *.rp* erase *.rp*
cd ../../..
cd skims/auto/ni
if exist *.rp* erase *.rp*
cd ../../..
REM bidirectional skims
cd skims/bidirectional/distance
if exist *.rp* erase *.rp*
cd ../../..
cd skims/bidirectional/time
if exist *.rp* erase *.rp*
cd ../../..
cd skims/bidirectional/generalized_cost
if exist *.rp* erase *.rp*
cd ../../..
REM estimation skims
cd skims/estimation/am
if exist *.rp* erase *.rp*
cd ../../..
cd skims/estimation/md
if exist *.rp* erase *.rp*
cd ../../..
REM intrazonal/terminal times
cd skims/iz_tt
if exist *.rp* erase *.rp*
cd ../..
REM non-motorized skims
cd skims/nonmotorized/am
if exist *.rp* erase *.rp*
cd ../../..
REM park and ride skims
cd skims/pnr/income1
if exist *.rp* erase *.rp*
cd ../../..
cd skims/pnr/income2
if exist *.rp* erase *.rp*
cd ../../..
cd skims/pnr/income3
if exist *.rp* erase *.rp*
cd ../../..
cd skims/pnr/income4
if exist *.rp* erase *.rp*
cd ../../..
REM transit skims
cd skims/transit/am/all_mode
if exist *.rp* erase *.rp*
cd ../../../..
cd skims/transit/md/all_mode
if exist *.rp* erase *.rp*
cd ../../../..
REM time of day
cd timeofday/delay/allpurposes
if exist *.rp* erase *.rp*
cd ../../..
cd timeofday/hbother/hov
if exist *.rp* erase *.rp*
cd ../../..
cd timeofday/hbother/sov
if exist *.rp* erase *.rp*
cd ../../..
cd timeofday/hbshop/hov
if exist *.rp* erase *.rp*
cd ../../..
cd timeofday/hbshop/sov
if exist *.rp* erase *.rp*
cd ../../..
cd timeofday/hbwork/hov
if exist *.rp* erase *.rp*
cd ../../..
cd timeofday/hbwork/sov/income1
if exist *.rp* erase *.rp*
cd ../../../..
cd timeofday/hbwork/sov/income2
if exist *.rp* erase *.rp*
cd ../../../..
cd timeofday/hbwork/sov/income3
if exist *.rp* erase *.rp*
cd ../../../..
cd timeofday/hbwork/sov/income4
if exist *.rp* erase *.rp*
cd ../../../..
REM auto trip tables
cd triptables/autos/am
if exist *.rp* erase *.rp*
cd ../../..
cd triptables/autos/md
if exist *.rp* erase *.rp*
cd ../../..
cd triptables/autos/pm
if exist *.rp* erase *.rp*
cd ../../..
cd triptables/autos/ev
if exist *.rp* erase *.rp*
cd ../../..
cd triptables/autos/ni
if exist *.rp* erase *.rp*
cd ../../..
REM non-motorized trip tables
cd triptables/nonmotorized/all
if exist *.rp* erase *.rp*
cd ../../..
REM park and ride trip tables
cd triptables/parkandride/income1
if exist *.rp* erase *.rp*
cd ../../..
cd triptables/parkandride/income2
if exist *.rp* erase *.rp*
cd ../../..
cd triptables/parkandride/income3
if exist *.rp* erase *.rp*
cd ../../..
cd triptables/parkandride/income4
if exist *.rp* erase *.rp*
cd ../../..
REM transit walk-access trip tables
cd triptables/transit/walkaccess
if exist *.rp* erase *.rp*
cd ../../..
REM truck trip tables
cd triptables/trucks
if exist *.rp* erase *.rp*
cd ../..
REM truck model
cd trucks/distribution
if exist *.rp* erase *.rp*
cd ../..
cd trucks/generation
if exist *.rp* erase *.rp*
cd ../..
REM vehicle availability
cd vehicleavailability/all
if exist *.rp* erase *.rp*
cd ../..
REM summary reports
REM generation
cd generation/trip/summaries
if exist *.rp* erase *.rp*
cd ../../..
REM distribution
cd distribution/summaries
if exist *.rp* erase *.rp*
cd ../..
REM vehicle availability
cd vehicleavailability/all/summaries
if exist *.rp* erase *.rp*
cd ../../..
REM trip tables
cd triptables/summaries
if exist *.rp* erase *.rp*
cd ../..