 # Sample Environment: CF-12 
# Sample: hot stick

# Doppler = 4.7 m/s, 75mm
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399 

# Direct neutrons & Analysed neutrons 3 time sets
# BKG mode; tAUX time channels [6.45 10.9 1 4.45 0 0] (set 0 analysed, set 1 direct, set 2 rest) (top to bottom)

# Chopper phase = -88 deg
# chom = 21.5deg
# Chopper = GC = -2426 rpm
# background chopper = BC= 1213 rpm

histmem stop

#set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
#wait 10

histmem mode time
histmem preset 3600


#drive tc1_temp0_setpoint 320 tc2_temp0_setpoint 323

samplename GG1_C7D8_323K
for {set idx0 0} {$idx0 < 12} {incr idx0} {
	broadcast loop $idx0 GG1_C7D8_323K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

