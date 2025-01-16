 # Sample Environment: CF-12 
# Sample: room-temp-holder

# Doppler = 4.7 m/s
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999


# Direct neutrons & Analysed neutrons 3 time sets
# BKG mode; tAUX time channels [6.45 10.9 1 4.45 0 0] (set 0 analysed, set 1 direct, set 2 rest) (top to bottom)


# Chopper phase = -64 deg
# chom = 21.5deg
# Chopper = BC = -2426 rpm
# background chopper = GC= 1213 rpm

histmem stop

histmem mode time
histmem preset 3600


#drive tc1_temp0_setpoint 50 tc2_temp0_setpoint 100
#wait 900 

# acquisition 12 blocks of 1 hour at RT

samplename room-temp-holder_chom21.5
for {set idx0 0} {$idx0 < 12} {incr idx0} {
	broadcast loop $idx0 room-temp-holder_chom21.5 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

#drive tc1_temp0_setpoint 300 tc2_temp0_setpoint 300



