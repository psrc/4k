REM summary reports
REM generation
cd summaries/generation
if exist *.rp* erase *.rp*
cd ../..
REM distribution
cd summaries/distribution
if exist *.rp* erase *.rp*
cd ../..
REM vehicle availability
cd summaries/vehicleavailability
if exist *.rp* erase *.rp*
cd ../..
REM trip tables
cd summaries/triptables
if exist *.rp* erase *.rp*
cd ../..
REM mode choice
cd summaries/modechoice
if exist *.rp* erase *.rp*
cd ../..
REM auto assignments
cd summaries/assignments/auto
if exist *.rp* erase *.rp*
cd ../../..