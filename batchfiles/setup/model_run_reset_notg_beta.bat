REM resets folders and emmebanks for new model run
REM auto assignments
cd assignments\auto\am
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\assignments\auto\am" /e
cd ..\..\..
cd assignments\auto\md
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\assignments\auto\md" /e
cd ..\..\..
cd assignments\auto\pm
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\assignments\auto\pm" /e
cd ..\..\..
cd assignments\auto\ev
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\assignments\auto\ev" /e
cd ..\..\..
cd assignments\auto\ni
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\assignments\auto\ni" /e
cd ..\..\..
REM non-motorized assignments
cd assignments\nonmotorized\am
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\assignments\nonmotorized\am" /e 
cd ..\..\..
REM transit assignments
cd assignments\transit\am\all_mode
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\..\input\%highpnr%\emmebanks\assignments\transit\am\all_mode" /e
cd ..\..\..\..
cd assignments\transit\md\all_mode
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\..\input\%highpnr%\emmebanks\assignments\transit\md\all_mode" /e 
cd ..\..\..\..
REM distribution
cd distribution\hbcollege
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\input\%highpnr%\emmebanks\distribution\hbcollege" /e
cd ..\..
cd distribution\hbother
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\input\%highpnr%\emmebanks\distribution\hbother" /e
cd ..\..
cd distribution\hbschool
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\input\%highpnr%\emmebanks\distribution\hbschool" /e
cd ..\..
cd distribution\hbshop
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\input\%highpnr%\emmebanks\distribution\hbshop" /e
cd ..\..
cd distribution\hbwork_inc1
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\input\%highpnr%\emmebanks\distribution\hbwork_inc1" /e
cd ..\..
cd distribution\hbwork_inc2
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\input\%highpnr%\emmebanks\distribution\hbwork_inc2" /e
cd ..\..
cd distribution\hbwork_inc3
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\input\%highpnr%\emmebanks\distribution\hbwork_inc3" /e
cd ..\..
cd distribution\hbwork_inc4
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\input\%highpnr%\emmebanks\distribution\hbwork_inc4" /e
cd ..\..
cd distribution\nhbother
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\input\%highpnr%\emmebanks\distribution\nhbother" /e
cd ..\..
cd distribution\nhbwork
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\input\%highpnr%\emmebanks\distribution\nhbwork" /e
cd ..\..
REM trip generation
REM cd generation\trip
REM if exist emmebank erase emmebank
REM if exist PATHS* erase PATHS*
REM if exist errors erase errors
REM if exist *.rp* erase *.rp*
REM xcopy "..\..\input\%highpnr%\emmebanks\generation\trip" /e
REM cd ..\..
REM market segmentation
cd marketsegmentation\nonwork
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\input\%highpnr%\emmebanks\marketsegmentation\nonwork" /e
cd ..\..
cd marketsegmentation\work
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\input\%highpnr%\emmebanks\marketsegmentation\work" /e
cd ..\..
REM mode choice
cd modechoice\hbcollege
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\input\%highpnr%\emmebanks\modechoice\hbcollege" /e
cd ..\..
cd modechoice\hbnonwork
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\input\%highpnr%\emmebanks\modechoice\hbnonwork" /e
cd ..\..
cd modechoice\hbschool
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\input\%highpnr%\emmebanks\modechoice\hbschool" /e
cd ..\..
cd modechoice\hbwork_inc1
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\input\%highpnr%\emmebanks\modechoice\hbwork_inc1" /e
cd ..\..
cd modechoice\hbwork_inc2
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\input\%highpnr%\emmebanks\modechoice\hbwork_inc2" /e
cd ..\..
cd modechoice\hbwork_inc3
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\input\%highpnr%\emmebanks\modechoice\hbwork_inc3" /e
cd ..\..
cd modechoice\hbwork_inc4
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\input\%highpnr%\emmebanks\modechoice\hbwork_inc4" /e
cd ..\..
cd modechoice\nhb
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\input\%highpnr%\emmebanks\modechoice\nhb" /e
cd ..\..
REM networks
cd networks
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\input\%highpnr%\emmebanks\networks" /e 
cd ..
REM auto skims
cd skims\auto\am
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\skims\auto\am" /e
cd ..\..\..
cd skims\auto\md
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\skims\auto\md" /e
cd ..\..\..
cd skims\auto\pm
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\skims\auto\pm" /e
cd ..\..\..
cd skims\auto\ev
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\skims\auto\ev" /e
cd ..\..\..
cd skims\auto\ni
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\skims\auto\ni" /e
cd ..\..\..
REM bidirectional skims
cd skims\bidirectional\distance
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\skims\bidirectional\distance" /e
cd ..\..\..
cd skims\bidirectional\time
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\skims\bidirectional\time" /e
cd ..\..\..
cd skims\bidirectional\generalized_cost
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\skims\bidirectional\generalized_cost" /e
cd ..\..\..
REM intrazonal\terminal times
cd skims\iz_tt
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\input\%highpnr%\emmebanks\skims\iz_tt" /e
cd ..\..
REM non-motorized skims
cd skims\nonmotorized\am
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\skims\nonmotorized\am" /e
cd ..\..\..
REM park and ride skims
cd skims\pnr\income1
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\skims\pnr\income1" /e
cd ..\..\..
cd skims\pnr\income2
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\skims\pnr\income2" /e
cd ..\..\..
cd skims\pnr\income3
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\skims\pnr\income3" /e
cd ..\..\..
cd skims\pnr\income4
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\skims\pnr\income4" /e
cd ..\..\..
REM transit skims
cd skims\transit\am\all_mode
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\..\input\%highpnr%\emmebanks\skims\transit\am\all_mode" /e
cd ..\..\..\..
cd skims\transit\md\all_mode
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\..\input\%highpnr%\emmebanks\skims\transit\md\all_mode" /e
cd ..\..\..\..
REM time of day
cd timeofday\delay\allpurposes
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\timeofday\delay\allpurposes" /e
cd ..\..\..
cd timeofday\hbother\hov
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\timeofday\hbother\hov" /e
cd ..\..\..
cd timeofday\hbother\sov
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\timeofday\hbother\sov" /e
cd ..\..\..
cd timeofday\hbshop\hov
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\timeofday\hbshop\hov" /e
cd ..\..\..
cd timeofday\hbshop\sov
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\timeofday\hbshop\sov" /e
cd ..\..\..
cd timeofday\hbwork\hov
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\timeofday\hbwork\hov" /e
cd ..\..\..
cd timeofday\hbwork\sov\income1
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\..\input\%highpnr%\emmebanks\timeofday\hbwork\sov\income1" /e
cd ..\..\..\..
cd timeofday\hbwork\sov\income2
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\..\input\%highpnr%\emmebanks\timeofday\hbwork\sov\income2" /e
cd ..\..\..\..
cd timeofday\hbwork\sov\income3
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\..\input\%highpnr%\emmebanks\timeofday\hbwork\sov\income3" /e
cd ..\..\..\..
cd timeofday\hbwork\sov\income4
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\..\input\%highpnr%\emmebanks\timeofday\hbwork\sov\income4" /e
cd ..\..\..\..
REM auto trip tables
cd triptables\autos\am
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\triptables\autos\am" /e
cd ..\..\..
cd triptables\autos\md
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\triptables\autos\md" /e
cd ..\..\..
cd triptables\autos\pm
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\triptables\autos\pm" /e
cd ..\..\..
cd triptables\autos\ev
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\triptables\autos\ev" /e
cd ..\..\..
cd triptables\autos\ni
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\triptables\autos\ni" /e
cd ..\..\..
REM non-motorized trip tables
cd triptables\nonmotorized\all
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\triptables\nonmotorized\all" /e 
cd ..\..\..
REM park and ride trip tables
cd triptables\parkandride\income1
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\triptables\parkandride\income1" /e
cd ..\..\..
cd triptables\parkandride\income2
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\triptables\parkandride\income2" /e
cd ..\..\..
cd triptables\parkandride\income3
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\triptables\parkandride\income3" /e
cd ..\..\..
cd triptables\parkandride\income4
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\triptables\parkandride\income4" /e
cd ..\..\..
REM transit walk-access trip tables
cd triptables\transit\walkaccess
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\..\input\%highpnr%\emmebanks\triptables\transit\walkaccess" /e
cd ..\..\..
REM truck trip tables
cd triptables\trucks
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\input\%highpnr%\emmebanks\triptables\trucks" /e
cd ..\..
REM truck model
cd trucks\distribution
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\input\%highpnr%\emmebanks\trucks\distribution" /e
cd ..\..
REM cd trucks\generation
REM if exist emmebank erase emmebank
REM if exist PATHS* erase PATHS*
REM if exist errors erase errors
REM if exist *.rp* erase *.rp*
REM xcopy "..\..\input\%highpnr%\emmebanks\trucks\generation" /e
REM cd ..\..
REM vehicle availability
cd vehicleavailability\all
if exist emmebank erase emmebank
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*
xcopy "..\..\input\%highpnr%\emmebanks\vehicleavailability\all" /e
cd ..\..