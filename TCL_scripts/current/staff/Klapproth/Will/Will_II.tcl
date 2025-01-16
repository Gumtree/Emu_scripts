# Sample Environment: CF-12 
# Sample: 60W Na-montmorillonite

# Doppler = 0 m/s
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 0 40.42 1 1000 16 50 0 255 0 999 

# Chopper phase = -64 deg
# chom = 21.5 deg
# mom = 21.0 deg

histmem stop

hset sample/tc2/temp0/auto 1

#QENS############################################################################

# QENS  323K
drive tc1_temp0_setpoint 300 tc2_temp0_setpoint 323

#Doppler
hset instrument/doppler/ctrl/run_cmd 1   
wait 5
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 5

histmem mode time
histmem preset 3600

#LOOP  
samplename Na_Mt_sample2_140wt_323K
for {set idx0 0} {$idx0 < 16} {incr idx0} {
	broadcast loop $idx0 Na_Mt_sample2_140wt_323K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
} 


#EFW######################################################################################
##################################################################################
# EFW: 323-333K
drive tc1_temp0_setpoint 300 tc2_temp0_setpoint 323

#Doppler
hset instrument/doppler/ctrl/run_cmd 0 
wait 5
set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999
wait 5


# Start loop 0
histmem mode time
histmem preset 240

samplename Na_Mt_sample2_140wt_323-333K
newfile TOTAL_HISTOGRAM_T TOTAL_HISTOGRAM_XT
for {set idx0 0} {$idx0 < 11} {incr idx0} {
	broadcast target [expr $idx0*(1)+323]
	
	broadcast Target temperature = [expr $idx0*1+323]
	drive tc2_temp0_setpoint [expr $idx0*1+323]
	wait 60
	 
	broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	histmem start block
	broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	
	save $idx0
}


#QENS############################################################################

# Temperature: QENS  333K
drive tc1_temp0_setpoint 300 tc2_temp0_setpoint 333

#Doppler
hset instrument/doppler/ctrl/run_cmd 1   
wait 5
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 5

histmem mode time
histmem preset 3600

#LOOP acquisition of  16 x 1 hour blocks 
samplename Na_Mt_sample2_140wt_333K
for {set idx0 0} {$idx0 < 16} {incr idx0} {
	broadcast loop $idx0 Na_Mt_sample2_140wt_323K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

#EFW######################################################################################
##################################################################################
# EFW: 333-353K
drive tc1_temp0_setpoint 300 tc2_temp0_setpoint 333

#Doppler
hset instrument/doppler/ctrl/run_cmd 0 
wait 5
set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999
wait 5


# Start loop 0
histmem mode time
histmem preset 240

samplename Na_Mt_sample2_140wt_333-353K
newfile TOTAL_HISTOGRAM_T TOTAL_HISTOGRAM_XT
for {set idx0 0} {$idx0 < 11} {incr idx0} {
	broadcast target [expr $idx0*(1)+333]
	
	broadcast Target temperature = [expr $idx0*1+333]
	drive tc2_temp0_setpoint [expr $idx0*1+333]
	wait 60
	
	broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	histmem start block
	broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	
	save $idx0
}

#QENS############################################################################

# Temperature: QENS  353K
drive tc1_temp0_setpoint 300 tc2_temp0_setpoint 353

#Doppler
hset instrument/doppler/ctrl/run_cmd 1   
wait 5
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 5

histmem mode time
histmem preset 3600

#LOOP acquisition of  16 x 1 hour blocks 
samplename Na_Mt_sample2_140wt_353K
for {set idx0 0} {$idx0 < 16} {incr idx0} {
	broadcast loop $idx0 Na_Mt_sample2_140wt_323K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
