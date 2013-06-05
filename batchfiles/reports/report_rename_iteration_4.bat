rem rename assignment report files
cd assignments/auto/am
if exist *.rp4 erase *.rp4
ren *.rpt *rp4
cd ../md
if exist *.rp4 erase *.rp4
ren *.rpt *rp4
cd ../pm
if exist *.rp4 erase *.rp4
ren *.rpt *rp4
cd ../ev
if exist *.rp4 erase *.rp4
ren *.rpt *rp4
cd ../ni
if exist *.rp4 erase *.rp4
ren *.rpt *rp4
cd ../../..