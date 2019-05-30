# Sample Environment: CF-12, cold stick 
# Sample:  annular can

# Direct neutrons & Analysed neutrons 3 time sets
# low BKG mode; tAUX time channels [6.45 10.9 1 4.45 0 0] (set 0 analysed, set 1 direct, set 2 rest) (top to bottom)

# Chopper phase = -88 deg
# chom = 21.5 deg

# Low Background Mode
# Chopper = GC = -2426 rpm
# Background Chopper = BC= 1213 rpm
 
############################################################################################################

histmem stop

# Doppler = 4.7 m/s (QENS) amplitude: 75mm
hset instrument/doppler/ctrl/run_cmd 1
wait 10

# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 0<VdetHeightBins<255 0<DopTbins<999
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999

histmem mode time
histmem preset 3600



###########################################################################################################
# acquisition 13 blocks of 1 hour at 263K

#drive tc2_temp0_setpoint 280 tc1_temp0_setpoint 258 tc2_temp6_setpoint 263
#wait 60 

samplename C3H8_D2O_gas_loading_stick_263K_new
for {set idx0 0} {$idx0 <15} {incr idx0} {
	broadcast loop $idx0 samplename C3H8_D2O_gas_loading_stick_263K_new
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

###########################################################################################################
# acquisition 13 blocks of 1 hour at 263K

#drive tc2_temp0_setpoint 280 tc1_temp0_setpoint 258 tc2_temp6_setpoint 263
#wait 60 

samplename C3H8_D2O_gas_loading_stick_263K_new
for {set idx0 0} {$idx0 <15} {incr idx0} {
	broadcast loop $idx0 samplename C3H8_D2O_gas_loading_stick_263K_new
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


