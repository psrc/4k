cd am
call emme -ng --set-iks 127.0.0.1 000 -m macros\am_auto_network_summary.mac
cd ..
cd md
call emme -ng --set-iks 127.0.0.1 000 -m macros\md_auto_network_summary.mac
cd ..
cd pm
call emme -ng --set-iks 127.0.0.1 000 -m macros\pm_auto_network_summary.mac
cd ..
cd ev
call emme -ng --set-iks 127.0.0.1 000 -m macros\ev_auto_network_summary.mac
cd ..
cd ni
call emme -ng --set-iks 127.0.0.1 000 -m macros\ni_auto_network_summary.mac
cd ..