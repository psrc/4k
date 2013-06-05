rem rename assignment report files
cd assignments/auto/am
if exist *.rpf erase *.rpf
ren *.rpt *rpf
cd ../md
if exist *.rpf erase *.rpf
ren *.rpt *rpf
cd ../pm
if exist *.rpf erase *.rpf
ren *.rpt *rpf
cd ../ev
if exist *.rpf erase *.rpf
ren *.rpt *rpf
cd ../ni
if exist *.rpf erase *.rpf
ren *.rpt *rpf
cd ../../..