rem highest internal taz number
set hightaz=%1
rem lowest external station number
set lowstation=%2
rem highest external station number
set highstation=%3
rem low end of pnr zone range
set lowpnr=%4
rem high end of pnr zone range
set highpnr=%5
rem assignment iterations
if exist asc_calibration.rpt erase asc_calibration.rpt
cd ..\..
rem trip totals
cd hbwork_inc1
call emme -ng --set-iks 127.0.0.1 000 -m macros\18_asc_calibration_1.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
cd ..
cd hbwork_inc2
call emme -ng --set-iks 127.0.0.1 000 -m macros\18_asc_calibration_1.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
cd ..
cd hbwork_inc3
call emme -ng --set-iks 127.0.0.1 000 -m macros\18_asc_calibration_1.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
cd ..
cd hbwork_inc4
call emme -ng --set-iks 127.0.0.1 000 -m macros\18_asc_calibration_1.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
cd ..
cd hbnonwork
call emme -ng --set-iks 127.0.0.1 000 -m macros\18_asc_calibration_1.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
cd ..
cd hbschool
call emme -ng --set-iks 127.0.0.1 000 -m macros\18_asc_calibration_1.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
cd ..
cd hbcollege
call emme -ng --set-iks 127.0.0.1 000 -m macros\18_asc_calibration_1.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
cd ..
cd nhb
call emme -ng --set-iks 127.0.0.1 000 -m macros\18_asc_calibration_1.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
cd ..
rem asc values
cd hbwork_inc1
call emme -ng --set-iks 127.0.0.1 000 -m macros\18_asc_calibration_2.mac
cd ..
cd hbwork_inc2
call emme -ng --set-iks 127.0.0.1 000 -m macros\18_asc_calibration_2.mac
cd ..
cd hbwork_inc3
call emme -ng --set-iks 127.0.0.1 000 -m macros\18_asc_calibration_2.mac
cd ..
cd hbwork_inc4
call emme -ng --set-iks 127.0.0.1 000 -m macros\18_asc_calibration_2.mac
cd ..
cd hbnonwork
call emme -ng --set-iks 127.0.0.1 000 -m macros\18_asc_calibration_2.mac
cd ..
cd hbschool
call emme -ng --set-iks 127.0.0.1 000 -m macros\18_asc_calibration_2.mac
cd ..
cd hbcollege
call emme -ng --set-iks 127.0.0.1 000 -m macros\18_asc_calibration_2.mac
cd ..
cd nhb
call emme -ng --set-iks 127.0.0.1 000 -m macros\18_asc_calibration_2.mac
cd ..
cd summaries\calibration