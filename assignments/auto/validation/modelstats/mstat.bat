if exist mstat.txt erase mstat.txt
cd ..\..
cd am
call emme -ng --set-iks 127.0.0.1 000 -m ..\validation\modelstats\mstat_am.mac
cd ..
cd md
call emme -ng --set-iks 127.0.0.1 000 -m ..\validation\modelstats\mstat_md.mac
cd ..
cd pm
call emme -ng --set-iks 127.0.0.1 000 -m ..\validation\modelstats\mstat_pm.mac
cd ..
cd ev
call emme -ng --set-iks 127.0.0.1 000 -m ..\validation\modelstats\mstat_ev.mac
cd ..
cd ni
call emme -ng --set-iks 127.0.0.1 000 -m ..\validation\modelstats\mstat_ni.mac
cd ..\validation\modelstats
REM echo *** Model Stat is Done ***
