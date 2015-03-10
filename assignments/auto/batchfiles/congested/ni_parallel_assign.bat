cd ni
call emme -ng --set-iks 127.0.0.1 000 -m Macros\6_calculate_ni_arterial_delay.mac %hightaz% %lowstation% %highstation% %lowpnr% %highpnr%
call emme -ng --set-iks 127.0.0.1 000 -m Macros\8_ni_auto_assignment.mac %assigniter% %brgap%
call emme -ng --set-iks 127.0.0.1 000 -m Macros\9_calculate_total_vehicles.mac
cd ..
echo "ni assignment finished" > doneni.ind
exit