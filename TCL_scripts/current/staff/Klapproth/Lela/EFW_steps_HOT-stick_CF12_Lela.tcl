# Sample Environment: CF-12 
# Sample: annular can

# Doppler = 0 m/s, FEW
#

# Chopper phase = -88 deg
# chom = 21.5 deg
# GC =  2426 rpm


histmem stop

#Doppler: off
#hset /instrument/doppler/ctrl/run_cmd 0
#wait 10

# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 0<VdetHeightBins<255 0<DopTbins<999
#set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

histmem mode time
histmem preset 180



# Temperature = 322K -282K

#drive tc1_temp0_setpoint 314 tc2_temp0_setpoint 319
run tc1_temp0_setpoint 314
run tc2_temp0_setpoint 319
wait 180


broadcast EFW-cool

newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
samplename sample1_10SC_34_66_2pcNaCl_FEW_2
for {set idx0 0} {$idx0 < 37} {incr idx0} {
	broadcast target [expr $idx0*(-1)+319]
	
	run tc1_temp0_setpoint [expr $idx0*(-1)+314]
	run tc2_temp0_setpoint [expr $idx0*(-1)+319]
	
	#wait 240
	broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	histmem start block
	save $idx0
}



