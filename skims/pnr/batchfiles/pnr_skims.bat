REM Puget Sound 4k: Trip Based Model
REM Updated December 2017
REM File created by PSRC staff
REM Batch File to begin pnr skims

cd income1
if exist *.rpt erase *.rpt
REM call pnr income group 1 skim macros
call emme -ng 000 -m ..\macros\1_initialize_matrices.mac 1 %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%

cd..
cd income2
if exist *.rpt erase *.rpt
REM call pnr income group 2 skim macros
call emme -ng 000 -m ..\macros\1_initialize_matrices.mac 2 %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%

cd..
cd income3
if exist *.rpt erase *.rpt
REM call pnr income group 3 skim macros
call emme -ng 000 -m ..\macros\1_initialize_matrices.mac 3 %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%

cd..
cd income4
if exist *.rpt erase *.rpt
REM call pnr income group 4 skim macros
call emme -ng 000 -m ..\macros\1_initialize_matrices.mac 4 %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%

cd..
REM erase all existing indicator (.ind) files
if exist *.ind erase *.ind
start batchfiles\pnr_income1_skims.bat
start batchfiles\pnr_income2_skims.bat
start batchfiles\pnr_income3_skims.bat
start batchfiles\pnr_income4_skims.bat
