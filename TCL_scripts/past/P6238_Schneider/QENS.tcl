 # Sample Environment: CF-12 
# Sample:sample 2, f-3 recktangular cell

# Doppler = 4.7 m/s
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999


# Direct neutrons & Analysed neutrons 3 time sets
# BKG mode; tAUX time channels [6.45 10.9 1 4.45 0 0] (set 0 analysed, set 1 direct, set 2 rest) (top to bottom)


# Chopper phase = -64 deg
# chom = 21.5 deg
# Chopper = BC = -2426 rpm
# background chopper = GC= 1213 rpm

#~45deg sample cell orientation towards incident

histmem stop

#change EMU from EFW to QENS mode 
#hset /instrument/doppler/ctrl/run_cmd 1
#wait 30
#set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999


histmem mode time
histmem preset 3600

#measure QENS spectra at 240K
drive tc1_temp0_setpoint 260 tc2_temp0_setpoint 370
drive tc1_pres3_setpoint 15
wait 300 

# acquisition 14 blocks of 1 hour at 240K

samplename f-3_370K  
for {set idx0 0} {$idx0 <14} {incr idx0} {
	broadcast loop $idx0 f-3_370K 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

 #measure QENS spectra at 200K
drive tc1_pres3_setpoint 60
 drive tc1_temp0_setpoint 195 tc2_temp0_setpoint 200
 drive tc1_pres3_setpoint 20
 wait 300
 
 # acquisition 14 blocks of 1 hour at 200K
 
 samplename f-3_200K_again_coolCycle  
 for {set idx0 0} {$idx0 <14} {incr idx0} {
	 broadcast loop $idx0 f-3_200K_again_coolCycle  
	 histmem start block
	 newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	 save 
 }