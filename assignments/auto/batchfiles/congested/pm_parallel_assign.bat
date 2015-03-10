cd pm
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_calculate_pm_arterial_delay.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m Macros\8_pm_auto_assignment.mac %assigniter% %brgap%
call emme -ng --set-iks 127.0.0.1 000 -m Macros\9_calculate_total_vehicles.mac
cd ..
echo "pm assignment finished" > donepm.ind
exit