   # Sample Environment: CF-12 
# Sample: cold stick

# Doppler = 4.7 m/s, 75mm
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399 

# Direct neutrons & Analysed neutrons 3 time sets
# BKG mode; tAUX time channels [6.45 10.9 1 4.45 0 0] (set 0 analysed, set 1 direct, set 2 rest) (top to bottom)

# Chopper phase = -88 deg
# chom = 21.5deg
# Chopper = GC = -2426 rpm
# background chopper = BC= 1213 rpm

histmem stop
hset sample/tc3/heater/heaterRange_1 3


hset instrument/doppler/ctrl/run_cmd 1 
wait 1
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 1

histmem mode time
histmem preset 1800
 
#################################################################################
#################################################################################
#drive tc1_pres7_setpoint 5
#drive tc3_driveable 298 tc3_driveable2 293
#wait 600

#acquisition of 12 x 1 hour blocks 
samplename vanadium_cooling
for {set idx0 0} {$idx0 < 16 } {incr idx0} {
	broadcast loop $idx0  vanadium_cooling
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
