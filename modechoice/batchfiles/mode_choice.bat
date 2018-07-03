REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM File created by PSRC staff
REM Batch file to run mode choice in the travel model.
REM All Purposes are run in the same bank, sequentially.
REM Matrices are re-initialized each iteration

cd all
call emme -ng 000 -m macros\1_initialize_matrices.mac
call emme -ng 000 -m macros\2_load_ensembles.mac
call emme -ng 000 -m macros\3_hbcollege.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\4_hbother.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\5_hbschool.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\6_nhb.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\7_hbwork1.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\8_hbwork2.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\9_hbwork3.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng 000 -m macros\10_hbwork4.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
cd ..
