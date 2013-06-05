rem rename assignment report files
cd assignments/auto/am
if exist *.rp1 erase *.rp1
ren *.rpt *rp1
cd ../md
if exist *.rp1 erase *.rp1
ren *.rpt *rp1
cd ../pm
if exist *.rp1 erase *.rp1
ren *.rpt *rp1
cd ../ev
if exist *.rp1 erase *.rp1
ren *.rpt *rp1
cd ../ni
if exist *.rp1 erase *.rp1
ren *.rpt *rp1
cd ../../..