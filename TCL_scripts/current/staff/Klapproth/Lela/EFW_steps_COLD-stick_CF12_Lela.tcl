# Sample Environment: CF-12 
# Sample: annular can

# Doppler = 0 m/s, FEW
#

# Chopper phase = -88 deg
# chom = 21.5 deg
# GC =  2426 rpm


histmem stop

#Doppler: off
hset /instrument/doppler/ctrl/run_cmd 0
wait 10

# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 0<VdetHeightBins<255 0<DopTbins<999
set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

histmem mode time
histmem preset 180


drive tc1_temp0_setpoint 188 tc2_temp6_setpoint 193
  
broadcast EFW-heat

#saved in individual files

samplename CO2_semi_TBAB_5_heating
for {set idx0 0} {$idx0 < 38} {incr idx0} {
	broadcast target [expr $idx0*(1)+193]
	
	run tc1_temp0_setpoint [expr $idx0*(1)+188]
	run tc2_temp6_setpoint [expr $idx0*(1)+193]
	
	wait 180
	broadcast [tc1_temp0_setpoint] [tc2_temp6_setpoint]
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T 
	#newfile ... outside loop data will be saved in one file
	
	save $idx0
}

#############################################################################


#Doppler: on
hset /instrument/doppler/ctrl/run_cmd 1
wait 10

# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 0<VdetHeightBins<255 0<DopTbins<999
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999

histmem mode time
histmem preset 3600

broadcast QENS 

drive tc1_temp0_setpoint 188 tc2_temp6_setpoint 193
wait 60

#acquisition of  2 x 1 hour blocks 
samplename CO2_semi_TBAB_5_193K
for {set idx0 0} {$idx0 < 12} {incr idx0} {
	broadcast loop $idx0  CO2_semi_TBAB_5_193K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


