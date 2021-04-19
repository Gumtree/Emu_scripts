# Sample Environment: CF-12 
# Sample: Vanadium, powder diffraction cell (diameter 6mm)

# Doppler = 4.7 m/s
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999


# Direct neutrons & Analysed neutrons 3 time sets
# BKG mode; tAUX time channels [6.45 10.9 1 4.45 0 0] (set 0 analysed, set 1 direct, set 2 rest) (top to bottom)


# Chopper phase = -64 deg
# chom = 21.5 deg
# Chopper = BC = -2426 rpm
# background chopper = GC= 1213 rpm


histmem mode time
histmem preset 3600


drive tc1_temp0_setpoint 300 tc2_temp0_setpoint 400
wait 900 

# acquisition 1 blocks of 1 hour at 400K

samplename Vanadium_400

	broadcast loop 1 V_400 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 




