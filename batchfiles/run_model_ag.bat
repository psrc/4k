REM run PSRC travel demand model
echo model start time: > model_start_time.out
time /t >> model_start_time.out
REM 
REM create networks
REM ---------------
cd input
call create_networks.bat
cd ..
REM setup auto assignments
REM ------------------------------
cd assignments/auto
REM AM
call am_setup.bat
REM MD
call md_setup.bat
REM PM
call pm_setup.bat
REM EV
call ev_setup.bat
REM NI
call ni_setup.bat
REM erase all existing indicator (.ind) files from root directory
cd ../..
if exist *_assign.ind erase *_assign.ind
REM run auto assignments in parallel
cd assignments/auto
call parallel_ff_assign.bat
cd ../..
REM confirm completion of all assignments before proceeding to next model step
call assignment_completion_check.bat
REM run AM transit assignment
REM -----------------------------------
cd assignments/transit/am
call am_all_mode_transit_ff_assign.bat
cd..
REM run MD transit assignment
REM -----------------------------------
cd md
call md_all_mode_transit_ff_assign.bat
cd ../..
REM run AM non-motorized assignments
REM --------------------------------
cd nonmotorized
call am_non_motorized_assignment.bat
cd ../..
REM calculate intrazonal skims and terminal times
REM ----------------------------------------------
cd skims
call iz_tt_skims.bat
cd ..
REM calculate free-flow auto skims
REM ------------------------------
REM erase all existing indicator (.ind) files from root directory
if exist *_skims.ind erase *_skims.ind
cd skims/auto
call auto_skims.bat
cd ../..
REM confirm completion of all auto skim calculations before proceeding to next model step
call auto_skims_completion_check.bat
REM calculate free-flow bidirectional auto skims
REM --------------------------------------------
cd skims/bidirectional
REM generalized cost
call bidirectional_generalized_cost_skims.bat
REM time
call bidirectional_time_skims.bat
REM distance
call bidirectional_distance_skims.bat
cd ..
REM calculate free-flow transit skims (walk access)
REM ---------------------------------
REM AM
cd transit/am
call am_all_mode_skims.bat
cd ..
REM MD
cd md
call md_all_mode_skims.bat
cd ../..
REM calculate AM non-motorized skims
REM --------------------------------
cd nonmotorized
call am_non_motorized_skims.bat
cd ../..
REM calculate am free-flow park and ride skims (drive access transit)
REM ---------------------------------------
REM erase all existing indicator (.ind) files from root directory
if exist *_pnrskims.ind erase *_pnrskims.ind
cd skims/pnr
call pnr_skims.bat
cd ../..
REM confirm completion of all pnr skim calculations before proceeding to next model step
call pnr_skims_completion_check.bat
REM run trip generation
REM -----------------------
cd generation
call activity_generation.bat
cd ..
REM run trip distribution
REM ---------------------
cd distribution
call trip_distribution_ag.bat
cd ..
echo end time: > model_end_time.out
time /t >> model_end_time.out