REM checks for emlock files in emmebank folders
REM auto assignments
cd assignments\auto\am
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
cd assignments\auto\md
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
cd assignments\auto\pm
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
cd assignments\auto\ev
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
cd assignments\auto\ni
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
REM non-motorized assignments
cd assignments\nonmotorized\am
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
REM transit assignments
cd assignments\transit\am\all_mode
@call ..\..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..\..
cd assignments\transit\md\all_mode
@call ..\..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..\..
REM distribution
cd distribution\hbcollege
@call ..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..
cd distribution\hbother
@call ..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..
cd distribution\hbschool
@call ..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..
cd distribution\hbshop
@call ..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..
cd distribution\hbwork_inc1
@call ..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..
cd distribution\hbwork_inc2
@call ..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..
cd distribution\hbwork_inc3
@call ..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..
cd distribution\hbwork_inc4
@call ..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..
cd distribution\nhbother
@call ..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..
cd distribution\nhbwork
@call ..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..
REM trip generation
cd generation\trip
@call ..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..
REM market segmentation
cd marketsegmentation\nonwork
@call ..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..
cd marketsegmentation\work
@call ..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..
REM mode choice
cd modechoice\hbcollege
@call ..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..
cd modechoice\hbnonwork
@call ..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..
cd modechoice\hbschool
@call ..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..
cd modechoice\hbwork_inc1
@call ..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..
cd modechoice\hbwork_inc2
@call ..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..
cd modechoice\hbwork_inc3
@call ..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..
cd modechoice\hbwork_inc4
@call ..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..
cd modechoice\nhb
@call ..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..
REM networks
cd networks
@call ..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..
REM auto skims
cd skims\auto\am
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
cd skims\auto\md
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
cd skims\auto\pm
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
cd skims\auto\ev
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
cd skims\auto\ni
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
REM bidirectional skims
cd skims\bidirectional\distance
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
cd skims\bidirectional\time
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
cd skims\bidirectional\generalized_cost
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
REM intrazonal\terminal times
cd skims\iz_tt
@call ..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..
REM non-motorized skims
cd skims\nonmotorized\am
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
REM park and ride skims
cd skims\pnr\income1
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
cd skims\pnr\income2
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
cd skims\pnr\income3
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
cd skims\pnr\income4
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
REM transit skims
cd skims\transit\am\all_mode
@call ..\..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..\..
cd skims\transit\md\all_mode
@call ..\..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..\..
REM time of day
cd timeofday\delay\allpurposes
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
cd timeofday\hbother\hov
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
cd timeofday\hbother\sov
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
cd timeofday\hbshop\hov
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
cd timeofday\hbshop\sov
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
cd timeofday\hbwork\hov
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
cd timeofday\hbwork\sov\income1
@call ..\..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..\..
cd timeofday\hbwork\sov\income2
@call ..\..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..\..
cd timeofday\hbwork\sov\income3
@call ..\..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..\..
cd timeofday\hbwork\sov\income4
@call ..\..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..\..
REM auto trip tables
cd triptables\autos\am
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
cd triptables\autos\md
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
cd triptables\autos\pm
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
cd triptables\autos\ev
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
cd triptables\autos\ni
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
REM non-motorized trip tables
cd triptables\nonmotorized\all
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
REM park and ride trip tables
cd triptables\parkandride\income1
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
cd triptables\parkandride\income2
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
cd triptables\parkandride\income3
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
cd triptables\parkandride\income4
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
REM transit walk-access trip tables
cd triptables\transit\walkaccess
@call ..\..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..\..
REM truck trip tables
cd triptables\trucks
@call ..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..
REM truck model
cd trucks\distribution
@call ..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..
cd trucks\generation
@call ..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..
REM vehicle availability
cd vehicleavailability\all
@call ..\..\batchfiles\nan\nan_test.bat .rpt
if errorlevel 4 (echo found "NaN") else (echo "NaN" not found)
if errorlevel 4 exit /b
cd ..\..