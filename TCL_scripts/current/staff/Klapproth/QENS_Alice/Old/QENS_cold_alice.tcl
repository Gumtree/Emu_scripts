# Sample Environment: CF-12, cold stick 

# Direct neutrons & Analysed neutrons 3 time sets
# BKG mode; tAUX time channels [6.45 10.9 1 4.45 0 0] (set 0 analysed, set 1 direct, set 2 rest) (top to bottom)

# Chopper phase = -88 deg
# chom = 21.5deg
# Chopper = GC = -2426 rpm
# background chopper = BC= 1213 rpm
#############################################################################
histmem stop

#cryo auto settings
#hset /sample/tc2/temp6/auto 1 
hset /sample/tc1/temp0/auto 1
hset /sample/tc1/pres3/auto 1
hset /sample/tc1/pres3/setpoint 30

# Doppler: on (Doppler = 4.7 m/s, 75mm)
hset /instrument/doppler/ctrl/run_cmd 1
wait 5

# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399 
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 5

histmem mode time
histmem preset 3600

##############################################################################

##############################################################################

drive tc1_temp0_setpoint 155 tc3_driveable2 160
wait 60  
hset /sample/tc1/pres3/setpoint 30  
wait 600 

# Acquisition 
samplename TBAB_high_CO2_2_160K
for {set idx0 0} {$idx0 < 12} {incr idx0} {
	broadcast loop $idx0 TBAB_high_CO2_2_160K 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

##############################################################################
drive tc1_temp0_setpoint 188 tc3_driveable2 193
#wait 60  
#hset /sample/tc1/pres3/setpoint 30  
wait 600

# Acquisition 
samplename TBAB_high_CO2_2_193K
for {set idx0 0} {$idx0 < 12} {incr idx0} {
	broadcast loop $idx0 TBAB_high_CO2_2_193K 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

##############################################################################
drive tc1_temp0_setpoint 225 tc3_driveable2 230
#wait 60  
#hset /sample/tc1/pres3/setpoint 30  
wait 600

# Acquisition 
samplename TBAB_high_CO2_2_230K
for {set idx0 0} {$idx0 < 12} {incr idx0} {
	broadcast loop $idx0 TBAB_high_CO2_2_230K 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
