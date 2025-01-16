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
#hset instrument/doppler/ctrl/run_cmd 1 
#wait 5
#set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
#wait 5

histmem mode time
histmem preset 3600

hset sample/tc3/heater/heaterRange_1 3


drive tc1_temp0_setpoint 293 tc3_driveable 298
wait 900

#acquisition of  12 x 1 hour blocks 
samplename MO_40_298K
for {set idx0 0} {$idx0 < 12} {incr idx0} {
	broadcast loop $idx0  MO_40_298K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

drive tc1_temp0_setpoint 300 tc3_driveable 323
wait 1800

#acquisition of  12 x 1 hour blocks 
samplename MO_40_323K
for {set idx0 0} {$idx0 < 12} {incr idx0} {
	broadcast loop $idx0  MO_40_323K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}