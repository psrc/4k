REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM File created by PSRC staff
REM Batch file to rename reports after each iteration

REM auto assignments
cd assignments/auto/am
ren *.rpt *.rp%1%
cd ../../..
cd assignments/auto/md
ren *.rpt *.rp%1%
cd ../../..
cd assignments/auto/pm
ren *.rpt *.rp%1%
cd ../../..
cd assignments/auto/ev
ren *.rpt *.rp%1%
cd ../../..
cd assignments/auto/ni
ren *.rpt *.rp%1%
cd ../../..
REM non-motorized assignments
cd assignments/nonmotorized/am
ren *.rpt *.rp%1%
cd ../../..
REM transit assignments
cd assignments/transit/am/all_mode
ren *.rpt *.rp%1%
cd ../../../..
cd assignments/transit/md/all_mode
ren *.rpt *.rp%1%
cd ../../../..
REM distribution
cd distribution/all
ren *.rpt *.rp%1%
cd ../..
REM mode choice
cd modechoice/hbcollege
ren *.rpt *.rp%1%
cd ../..
cd modechoice/hbnonwork
ren *.rpt *.rp%1%
cd ../..
cd modechoice/hbschool
ren *.rpt *.rp%1%
cd ../..
cd modechoice/hbwork_inc1
ren *.rpt *.rp%1%
cd ../..
cd modechoice/hbwork_inc2
ren *.rpt *.rp%1%
cd ../..
cd modechoice/hbwork_inc3
ren *.rpt *.rp%1%
cd ../..
cd modechoice/hbwork_inc4
ren *.rpt *.rp%1%
cd ../..
cd modechoice/nhb
ren *.rpt *.rp%1%
cd ../..
REM auto skims
cd skims/auto/am
ren *.rpt *.rp%1%
cd ../../..
cd skims/auto/md
ren *.rpt *.rp%1%
cd ../../..
cd skims/auto/pm
ren *.rpt *.rp%1%
cd ../../..
cd skims/auto/ev
ren *.rpt *.rp%1%
cd ../../..
cd skims/auto/ni
ren *.rpt *.rp%1%
cd ../../..
REM bidirectional skims
cd skims/bidirectional/distance
ren *.rpt *.rp%1%
cd ../../..
cd skims/bidirectional/time
ren *.rpt *.rp%1%
cd ../../..
cd skims/bidirectional/generalized_cost
ren *.rpt *.rp%1%
cd ../../..
REM intrazonal/terminal times
cd skims/iz_tt
ren *.rpt *.rp%1%
cd ../..
REM non-motorized skims
cd skims/nonmotorized/am
ren *.rpt *.rp%1%
cd ../../..
REM park and ride skims
cd skims/pnr/income1
ren *.rpt *.rp%1%
cd ../../..
cd skims/pnr/income2
ren *.rpt *.rp%1%
cd ../../..
cd skims/pnr/income3
ren *.rpt *.rp%1%
cd ../../..
cd skims/pnr/income4
ren *.rpt *.rp%1%
cd ../../..
REM transit skims
cd skims/transit/am/all_mode
ren *.rpt *.rp%1%
cd ../../../..
cd skims/transit/md/all_mode
ren *.rpt *.rp%1%
cd ../../../..
REM time of day
cd timeofday/delay/allpurposes
ren *.rpt *.rp%1%
cd ../../..
cd timeofday/hbother/hov
ren *.rpt *.rp%1%
cd ../../..
cd timeofday/hbother/sov
ren *.rpt *.rp%1%
cd ../../..
cd timeofday/hbshop/hov
ren *.rpt *.rp%1%
cd ../../..
cd timeofday/hbshop/sov
ren *.rpt *.rp%1%
cd ../../..
cd timeofday/hbwork/hov
ren *.rpt *.rp%1%
cd ../../..
cd timeofday/hbwork/sov/income1
ren *.rpt *.rp%1%
cd ../../../..
cd timeofday/hbwork/sov/income2
ren *.rpt *.rp%1%
cd ../../../..
cd timeofday/hbwork/sov/income3
ren *.rpt *.rp%1%
cd ../../../..
cd timeofday/hbwork/sov/income4
ren *.rpt *.rp%1%
cd ../../../..
REM auto trip tables
cd triptables/autos/am
ren *.rpt *.rp%1%
cd ../../..
cd triptables/autos/md
ren *.rpt *.rp%1%
cd ../../..
cd triptables/autos/pm
ren *.rpt *.rp%1%
cd ../../..
cd triptables/autos/ev
ren *.rpt *.rp%1%
cd ../../..
cd triptables/autos/ni
ren *.rpt *.rp%1%
cd ../../..
REM non-motorized trip tables
cd triptables/nonmotorized/all
ren *.rpt *.rp%1%
cd ../../..
REM park and ride trip tables
cd triptables/parkandride/income1
ren *.rpt *.rp%1%
cd ../../..
cd triptables/parkandride/income2
ren *.rpt *.rp%1%
cd ../../..
cd triptables/parkandride/income3
ren *.rpt *.rp%1%
cd ../../..
cd triptables/parkandride/income4
ren *.rpt *.rp%1%
cd ../../..
REM transit walk-access trip tables
cd triptables/transit/walkaccess
ren *.rpt *.rp%1%
cd ../../..
REM truck trip tables
cd triptables/trucks
ren *.rpt *.rp%1%
cd ../..
