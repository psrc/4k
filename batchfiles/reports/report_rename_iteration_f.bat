REM renames *.rpt (report) files for all folders
REM auto assignments
cd assignments/auto/am
ren *.rpt *.rpf
cd ../../..
cd assignments/auto/md
ren *.rpt *.rpf
cd ../../..
cd assignments/auto/pm
ren *.rpt *.rpf
cd ../../..
cd assignments/auto/ev
ren *.rpt *.rpf
cd ../../..
cd assignments/auto/ni
ren *.rpt *.rpf
cd ../../..
REM non-motorized assignments
cd assignments/nonmotorized/am
ren *.rpt *.rpf
cd ../../..
REM transit assignments
cd assignments/transit/am/all_mode
ren *.rpt *.rpf
cd ../../../..
cd assignments/transit/md/all_mode
ren *.rpt *.rpf
cd ../../../..
REM distribution
cd distribution/hbcollege
ren *.rpt *.rpf
cd ../..
cd distribution/hbother
ren *.rpt *.rpf
cd ../..
cd distribution/hbschool
ren *.rpt *.rpf
cd ../..
cd distribution/hbshop
ren *.rpt *.rpf
cd ../..
cd distribution/hbwork_inc1
ren *.rpt *.rpf
cd ../..
cd distribution/hbwork_inc2
ren *.rpt *.rpf
cd ../..
cd distribution/hbwork_inc3
ren *.rpt *.rpf
cd ../..
cd distribution/hbwork_inc4
ren *.rpt *.rpf
cd ../..
cd distribution/nhbother
ren *.rpt *.rpf
cd ../..
cd distribution/nhbwork
ren *.rpt *.rpf
cd ../..
REM trip generation
cd generation/trip
ren *.rpt *.rpf
cd ../..
REM market segmentation
cd marketsegmentation/nonwork
ren *.rpt *.rpf
cd ../..
cd marketsegmentation/work
ren *.rpt *.rpf
cd ../..
REM mode choice
cd modechoice/hbcollege
ren *.rpt *.rpf
cd ../..
cd modechoice/hbnonwork
ren *.rpt *.rpf
cd ../..
cd modechoice/hbschool
ren *.rpt *.rpf
cd ../..
cd modechoice/hbwork_inc1
ren *.rpt *.rpf
cd ../..
cd modechoice/hbwork_inc2
ren *.rpt *.rpf
cd ../..
cd modechoice/hbwork_inc3
ren *.rpt *.rpf
cd ../..
cd modechoice/hbwork_inc4
ren *.rpt *.rpf
cd ../..
cd modechoice/nhb
ren *.rpt *.rpf
cd ../..
REM networks
cd networks
ren *.rpt *.rpf
cd ..
REM auto skims
cd skims/auto/am
ren *.rpt *.rpf
cd ../../..
cd skims/auto/md
ren *.rpt *.rpf
cd ../../..
cd skims/auto/pm
ren *.rpt *.rpf
cd ../../..
cd skims/auto/ev
ren *.rpt *.rpf
cd ../../..
cd skims/auto/ni
ren *.rpt *.rpf
cd ../../..
REM bidirectional skims
cd skims/bidirectional/distance
ren *.rpt *.rpf
cd ../../..
cd skims/bidirectional/time
ren *.rpt *.rpf
cd ../../..
cd skims/bidirectional/generalized_cost
ren *.rpt *.rpf
cd ../../..
REM intrazonal/terminal times
cd skims/iz_tt
ren *.rpt *.rpf
cd ../..
REM non-motorized skims
cd skims/nonmotorized/am
ren *.rpt *.rpf
cd ../../..
REM park and ride skims
cd skims/pnr/income1
ren *.rpt *.rpf
cd ../../..
cd skims/pnr/income2
ren *.rpt *.rpf
cd ../../..
cd skims/pnr/income3
ren *.rpt *.rpf
cd ../../..
cd skims/pnr/income4
ren *.rpt *.rpf
cd ../../..
REM transit skims
cd skims/transit/am/all_mode
ren *.rpt *.rpf
cd ../../../..
cd skims/transit/md/all_mode
ren *.rpt *.rpf
cd ../../../..
REM time of day
cd timeofday/delay/allpurposes
ren *.rpt *.rpf
cd ../../..
cd timeofday/hbother/hov
ren *.rpt *.rpf
cd ../../..
cd timeofday/hbother/sov
ren *.rpt *.rpf
cd ../../..
cd timeofday/hbshop/hov
ren *.rpt *.rpf
cd ../../..
cd timeofday/hbshop/sov
ren *.rpt *.rpf
cd ../../..
cd timeofday/hbwork/hov
ren *.rpt *.rpf
cd ../../..
cd timeofday/hbwork/sov/income1
ren *.rpt *.rpf
cd ../../../..
cd timeofday/hbwork/sov/income2
ren *.rpt *.rpf
cd ../../../..
cd timeofday/hbwork/sov/income3
ren *.rpt *.rpf
cd ../../../..
cd timeofday/hbwork/sov/income4
ren *.rpt *.rpf
cd ../../../..
REM auto trip tables
cd triptables/autos/am
ren *.rpt *.rpf
cd ../../..
cd triptables/autos/md
ren *.rpt *.rpf
cd ../../..
cd triptables/autos/pm
ren *.rpt *.rpf
cd ../../..
cd triptables/autos/ev
ren *.rpt *.rpf
cd ../../..
cd triptables/autos/ni
ren *.rpt *.rpf
cd ../../..
REM non-motorized trip tables
cd triptables/nonmotorized/all
ren *.rpt *.rpf
cd ../../..
REM park and ride trip tables
cd triptables/parkandride/income1
ren *.rpt *.rpf
cd ../../..
cd triptables/parkandride/income2
ren *.rpt *.rpf
cd ../../..
cd triptables/parkandride/income3
ren *.rpt *.rpf
cd ../../..
cd triptables/parkandride/income4
ren *.rpt *.rpf
cd ../../..
REM transit walk-access trip tables
cd triptables/transit/walkaccess
ren *.rpt *.rpf
cd ../../..
REM truck trip tables
cd triptables/trucks
ren *.rpt *.rpf
cd ../..
REM truck model
cd trucks/distribution
ren *.rpt *.rpf
cd ../..
cd trucks/generation
ren *.rpt *.rpf
cd ../..
REM vehicle availability
cd vehicleavailability/all
ren *.rpt *.rpf
cd ../..
REM summary reports
REM generation
cd generation/trip/summaries
ren *.rpt *.rpf
cd ../../..
REM distribution
cd distribution/summaries
ren *.rpt *.rpf
cd ../..
REM vehicle availability
cd vehicleavailability/all/summaries
ren *.rpt *.rpf
cd ../../..
REM trip tables
cd triptables/summaries
ren *.rpt *.rpf
cd ../..