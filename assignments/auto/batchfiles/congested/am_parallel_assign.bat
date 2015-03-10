cd am
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_calculate_am_arterial_delay.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m Macros\8_am_auto_assignment.mac %assigniter% %brgap%
call emme -ng --set-iks 127.0.0.1 000 -m Macros\9_calculate_total_vehicles.mac
cd ..
echo "am assignment finished" > doneam.ind
exit