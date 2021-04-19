# Sample Environment: CF-12, cold stick 
# Sample: rectangular Tobermorite


# Direct neutrons & Analysed neutrons 3 time sets
# low BKG mode; tAUX time channels [6.45 10.9 1 4.45 0 0] (set 0 analysed, set 1 direct, set 2 rest) (top to bottom)

# Chopper phase = -88 deg
# chom = 21.5 deg
# Chopper = BC = -2426 rpm
# background chopper = GC= 1213 rpm


histmem stop

# Doppler = 4.7 m/s (QENS)
hset instrument/doppler/ctrl/run_cmd 1
wait 300

# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 0<VdetHeightBins<255 0<DopTbins<999
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999

histmem mode time
histmem preset 3600

drive tc1_temp0_setpoint 295
drive tc2_temp6_setpoint 300
#wait 300 

# acquisition 4 blocks of 1 hour at 300K

samplename Tobermorite_300K
for {set idx0 0} {$idx0 <4} {incr idx0} {
	broadcast loop $idx0 Tobermorite_300K  
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

drive tc1_temp0_setpoint 275
drive tc2_temp6_setpoint 280
#wait 300 

# acquisition 16 blocks of 1 hour at 280K

samplename Tobermorite_280K
for {set idx0 0} {$idx0 <16} {incr idx0} {
	broadcast loop $idx0 Tobermorite_280K  
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


drive tc1_temp0_setpoint 295
drive tc2_temp6_setpoint 300