# Sample Environment: CF-12 
# Sample: 0.5mm gap, annular cell

# Doppler = 4.7 m/s, 75mm
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399

# Direct neutrons & Analysed neutrons 3 time sets
# BKG mode; tAUX time channels [6.45 10.9 1 4.45 0 0] (set 0 analysed, set 1 direct, set 2 rest) (top to bottom)


# Chopper phase = -88 deg
# chom = 21.2 deg
# Chopper = BC = -2426 rpm
# background chopper = GC= 1213 rpm

histmem stop

histmem mode time
histmem preset 3600


drive tc2_temp0_setpoint 298

#Doppler: on (75mm, 4.7m/s)
#$hset /instrument/doppler/ctrl/run_cmd 1
#wait 10

# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 0<VdetHeightBins<255 0<DopTbins<999
#set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
#wait 10


samplename F108_D2O_298K_newBeautifulShield_down
for {set idx0 0} {$idx0 < 14} {incr idx0} {
	broadcast loop $idx0 F108_D2O_298K_newBeautifulShield_down
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}










