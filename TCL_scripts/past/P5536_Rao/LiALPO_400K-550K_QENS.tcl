# Sample Environment: CF-12 
# Sample:LiAlGePO, 0.5mm gap, annular cell

# Doppler = 3.5 m/s, amplitude  58 mm
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 8.687 20.21 1 1000 16 50 68 200 0 999


# Direct neutrons & Analysed neutrons 3 time sets
# BKG mode; tAUX time channels [6.45 10.9 1 4.45 0 0] (set 0 analysed, set 1 direct, set 2 rest) (top to bottom)


# Chopper phase = -64 deg
# chom = 21.5 deg
# Chopper = BC = -2426 rpm
# background chopper = GC= 1213 rpm


histmem mode time
histmem preset 3600


drive tc1_temp0_setpoint 298 tc2_temp0_setpoint 400
#wait 900 

# acquisition 10 blocks of 1 hour at 400K

samplename LiAlGePO_400k
for {set idx0 0} {$idx0 < 10} {incr idx0} {
	broadcast loop $idx0
	broadcast broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}



drive tc1_temp0_setpoint 298 tc2_temp0_setpoint 550
wait 900 


# acquisition 10 blocks of 1 hour at 550K

samplename LiAlGePO_400k
for {set idx0 0} {$idx0 < 10} {incr idx0} {
	broadcast loop $idx0
	broadcast broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}