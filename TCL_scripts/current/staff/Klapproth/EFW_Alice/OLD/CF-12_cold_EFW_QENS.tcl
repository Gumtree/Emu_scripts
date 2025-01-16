 # Sample Environment: CF-12, cold stick 


# Doppler = 4.7 m/s
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999


# Direct neutrons & Analysed neutrons 3 time sets
# BKG mode; tAUX time channels [6.45 10.9 1 4.45 0 0] (set 0 analysed, set 1 direct, set 2 rest) (top to bottom)


# Chopper phase = -88 deg
# chom = 21.5 deg
# Chopper = BC = -2426 rpm
# background chopper = GC= 1213 rpm
##################################################################
##################################################################
histmem stop

#Doppler off
#hset instrument/doppler/ctrl/run_cmd 0
#wait 10

#set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

#Initial measurement at given temperature
#samplename Vanadium_initial_EFW
#runscan dummy_motor 10 14 24 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }


# < 300K cool with VTI, (set 5K below stick set point)
#hset /sample/tc1/temp0/setpoint 1 
#hset /sample/tc2/temp6/setpoint 1


#samplename Vanadium_EFW_cooling
#runscan dummy_motor 10 14 180 time 180 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

#cool further < 10K
#hset /sample/tc1/pres3/setpoint 6

#samplename Vanadium_EFW_cold
#runscan dummy_motor 10 14 80 time 180 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

###################################################################

#change EMU from EFW to QENS mode 

#hset /instrument/doppler/ctrl/run_cmd 1
#wait 10

set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999


histmem mode time
histmem preset 3600


#drive tc1_temp0_setpoint 225 tc2_temp6_setpoint 230
#wait 300 

# acquisition QENS of 1 hour blocks at COLD

samplename Vanadium_1p6K
for {set idx0 0} {$idx0 < 16} {incr idx0} {
	broadcast loop $idx0 S2_f-4_230K  
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}



