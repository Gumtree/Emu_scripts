 # Sample Environment: CF-12 
# Sample:sample 2, f-4 rectangular cell, no Cd

# Doppler = 4.7 m/s
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999


# Direct neutrons & Analysed neutrons 3 time sets
# BKG mode; tAUX time channels [6.45 10.9 1 4.45 0 0] (set 0 analysed, set 1 direct, set 2 rest) (top to bottom)


# Chopper phase = -64 deg
# chom = 21.5 deg
# Chopper = GC = -2426 rpm
# background chopper = BC= 1213 rpm

#~45deg sample cell orientation towards incident

histmem stop

#change EMU from EFW to QENS mode 
#hset /instrument/doppler/ctrl/run_cmd 1
#wait 30
#set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999


histmem mode time
histmem preset 3600

#measure QENS spectra at 370K
drive tc1_temp0_setpoint 270 tc2_temp0_setpoint 370
drive tc1_pres3_setpoint 15
wait 300 

# acquisition 14 blocks of 1 hour 

samplename f-4_370K 
for {set idx0 0} {$idx0 < 14} {incr idx0} {
	broadcast loop $idx0 f-4_370K 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

#cool to 30K
drive tc1_pres3_setpoint 50
drive tc1_temp0_setpoint 0 tc2_temp0_setpoint 30
drive tc1_pres3_setpoint 20
 
