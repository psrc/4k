REM Puget Sound 4k: Trip Based Model
REM Created March 2015
REM File created by PSRC staff
REM Batch file to delete previous files and create all necessary databanks

REM ---------------------------------------------------------------
REM Assignments
REM ---------------------------------------------------------------

REM AM Peak Period Assignments
cd assignments\auto\am

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac
call emme -ng 000 -m macros\0-3_input_fixes.mac
call emme -ng 000 -m macros\0-4_output_centroids.mac

REM Midday Period Assignments
cd ..\md

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac
call emme -ng 000 -m macros\0-3_input_fixes.mac

REM PM Peak Period Assignments
cd ..\pm

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac
call emme -ng 000 -m macros\0-3_input_fixes.mac

REM Late Evening Period Assignments
cd ..\ev

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac
call emme -ng 000 -m macros\0-3_input_fixes.mac

REM Overnight Period Assignments
cd ..\ni

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac
call emme -ng 000 -m macros\0-3_input_fixes.mac

REM NonMotorized Assignments
cd ..\..\nonmotorized\am

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

REM AM Transit Assignments
cd ..\..\transit\am\all_mode

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

REM MD Transit Assignments
cd ..\..\md\all_mode

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

REM ---------------------------------------------------------------
REM Trip Distribution
REM ---------------------------------------------------------------

cd ..\..\..\..\distribution\all

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\initial\0-1_create_databank.mac
call emme -ng 000 -m macros\initial\0-2_create_networks.mac

REM ---------------------------------------------------------------
REM Mode Choice
REM ---------------------------------------------------------------

cd ..\..\modechoice\hbcollege

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\hbnonwork

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\hbschool

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\hbwork_inc1

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\hbwork_inc2

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\hbwork_inc3

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\hbwork_inc4

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\nhb

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

REM ---------------------------------------------------------------
REM Skims
REM ---------------------------------------------------------------

cd ..\..\skims\auto\am

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\md

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\pm

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\ev

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\ni

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\..\bidirectional\distance

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\time

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\generalized_cost

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\..\iz_tt

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\nonmotorized\am

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\..\pnr\income1

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\income2

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\income3

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\income4

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\..\transit\am\all_mode

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\..\md\all_mode

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

REM ---------------------------------------------------------------
REM Time of Day
REM ---------------------------------------------------------------

cd ..\..\..\..\timeofday\delay\allpurposes

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\..\hbother\hov

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\..\hbother\sov

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\..\hbshop\hov

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\..\hbshop\sov

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\..\hbwork\hov

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\..\hbwork\sov\income1

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\income2

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\income3

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\income4

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

REM ---------------------------------------------------------------
REM Trip Tables
REM ---------------------------------------------------------------

cd ..\..\..\..\triptables\autos\am

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\md

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\pm

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\ev

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\ni

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\..\nonmotorized\all

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\..\parkandride\income1

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\income2

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\income3

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\income4

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\..\transit\walkaccess

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

cd ..\..\trucks

REM Delete the Existing Files if present
if exist emmebank erase emmebank
if exist emmemat\*.emx erase emmemat\*.emx
if exist PATHS* erase PATHS*
if exist errors erase errors
if exist *.rp* erase *.rp*

REM Run macros to create the network, initialize matrices and read in data
call emme -ng newbank -m macros\0-1_create_databank.mac
call emme -ng 000 -m macros\0-2_create_networks.mac

REM Return to Root Directory
cd ..\..

echo Initial Setup of Databanks completed on %date% at %time%. >> psrc_4k_log.txt
