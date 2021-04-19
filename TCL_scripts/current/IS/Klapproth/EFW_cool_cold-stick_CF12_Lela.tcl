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




#drive tc2_temp0_setpoint 318

# Temperature = 318K -278K

drive tc1_temp0_setpoint 317 tc2_temp6_setpoint 318
wait 60

broadcast EFW-cool

newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
samplename PT_D2Oexcess_FEW_cool
for {set idx0 0} {$idx0 < 80} {incr idx0} {
	broadcast target [expr $idx0*(-0.5)+318]
	
	run tc1_temp0_setpoint [expr $idx0*(-0.5)+317]
	run tc2_temp6_setpoint [expr $idx0*(-0.5)+318]
	
	#wait 240
	broadcast [tc1_temp0_setpoint] [tc2_temp6_setpoint]
	histmem start block
	save $idx0
}



# continue QENS

histmem stop

#Doppler: on
hset /instrument/doppler/ctrl/run_cmd 1
wait 10

# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 0<VdetHeightBins<255 0<DopTbins<999
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999

histmem mode time
histmem preset 3600

drive tc1_temp0_setpoint 277 tc2_temp6_setpoint 278
wait 60

broadcast QENS-278K

samplename 20pc-SLES-CAPB-0pcNaCl_278K
for {set idx0 0} {$idx0 <12} {incr idx0} {
	broadcast loop $idx0 samplename 20pc-SLES-CAPB-0pcNaCl_278K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}




