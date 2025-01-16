# Sample Environment: CF-12, cold stick 

# Direct neutrons & Analysed neutrons 3 time sets
# BKG mode; tAUX time channels [6.45 10.9 1 4.45 0 0] (set 0 analysed, set 1 direct, set 2 rest) (top to bottom)

# Chopper phase = -88 deg
# chom = 21.5deg
# Chopper = GC = -2426 rpm
# background chopper = BC= 1213 rpm
#############################################################################
histmem stop


histmem mode time
histmem preset 3600


##############################################################################
# Doppler: 
hset /instrument/doppler/ctrl/run_cmd 0
wait 10
hset /instrument/doppler/ctrl/amplitude 75
hset /instrument/doppler/ctrl/velocity 2.4
hset /instrument/doppler/ctrl/run_cmd 1
wait 10


# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399 
set_chopper_config_with_roi 5.093 20.21 1 1000 16 50 0 255 0 999
wait 10

# Acquisition 16 blocks of 1 hour at 50K
samplename Vanadium_annu_Cd_cover_1p6K_5p093
for {set idx0 0} {$idx0 < 6} {incr idx0} {
	broadcast loop $idx0 Vanadium_annu_Cd_cover_1p6K_5p093
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

################################################################################
# Doppler: 
hset /instrument/doppler/ctrl/run_cmd 0
wait 10
hset /instrument/doppler/ctrl/amplitude 25
hset /instrument/doppler/ctrl/velocity 2
hset /instrument/doppler/ctrl/run_cmd 1
wait 10


# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399 
set_chopper_config_with_roi 12.733 20.21 1 1000 16 50 0 255 0 999
wait 10

# Acquisition 16 blocks of 1 hour at 50K
samplename Vanadium_annu_Cd_cover_1p6K_12p733
for {set idx0 0} {$idx0 < 6} {incr idx0} {
	broadcast loop $idx0 Vanadium_annu_Cd_cover_1p6K_12p733
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

##############################################################################
# Set temperature (VTI 5K below sample temperature always)
hset /sample/tc1/pres3/setpoint 50
drive tc1_temp0_setpoint 245 tc2_temp6_setpoint 250
wait 600

#drive som 241

# Acquisition 16 blocks of 1 hour at 50K
samplename Vanadium_annu_Cd_cover_1p6K_12p733
for {set idx0 0} {$idx0 < 6} {incr idx0} {
	broadcast loop $idx0 Vanadium_annu_Cd_cover_1p6K_12p733
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

##############################################################################
#drive tc1_temp0_setpoint 295 tc2_temp6_setpoint 300
