cd md
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_calculate_md_arterial_delay.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m Macros\8_md_auto_assignment.mac %assigniter% %brgap%
call emme -ng --set-iks 127.0.0.1 000 -m Macros\9_calculate_total_vehicles.mac
cd ..
echo "md assignment finished" > donemd.ind
exit