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
hset sample/tc2/temp6/auto 1

#Doppler: on
hset /instrument/doppler/ctrl/run_cmd 1
wait 3

set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 3

histmem mode time
histmem preset 3600


drive tc1_temp0_setpoint 267 tc2_temp0_setpoint 272
wait 300

# acquisition 12 blocks of 1 hour

samplename 1_perc_FmocFF_no_small_molecule_272K
for {set idx0 0} {$idx0 < 16} {incr idx0} {
	broadcast loop $idx0 1_perc_FmocFF_4mgpermL_etoposide_272K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

drive tc1_temp0_setpoint 295 tc2_temp0_setpoint 300
