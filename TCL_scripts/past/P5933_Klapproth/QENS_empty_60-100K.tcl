# Sample Environment: CF-12 
# Sample:empty can, 1mm gap, annular cell

# Doppler = 4.7 m/s, amplitude  75 mm
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999


# Direct neutrons & Analysed neutrons 3 time sets
# BKG mode; tAUX time channels [6.45 10.9 1 4.45 0 0] (set 0 analysed, set 1 direct, set 2 rest) (top to bottom)


# Chopper phase = -64 deg
# chom = 21.5 deg

# low BKG mode
# GC = -2426 rpm
# BC= 1213 rpm


histmem mode time
histmem preset 3600


#drive tc2_temp6_setpoint 100K
#wait 900 

# acquisition 8 blocks of 1 hour at 100K

samplename empty_can_60K-100K
for {set idx0 0} {$idx0 < 20} {incr idx0} {
	broadcast loop $idx0
	broadcast broadcast [tc1_temp0_setpoint] [tc2_temp6_setpoint]
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


