
histmem stop
hset instrument/doppler/ctrl/run_cmd 1
wait 10

set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999

histmem mode time
histmem preset 3600

samplename semi_CO2_TBAB_5_230K
for {set idx0 0} {$idx0 < 12} {incr idx0} {
	broadcast loop $idx0 semi_CO2_TBAB_5_230K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


#############################################################

hset instrument/doppler/ctrl/run_cmd 0
wait 10

set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

samplename semi_CO2_TBAB_5_initial_EFW
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

#(<300K cool with VTI, set 5K below stick set point)
hset /sample/tc1/temp0/setpoint 188 
hset /sample/tc2/temp6/setpoint 193


samplename semi_CO2_TBAB_5_cooling
runscan dummy_motor 10 14 48 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }



############################################################################################

hset instrument/doppler/ctrl/run_cmd 1
wait 10

set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999

drive tc1_temp0_setpoint 188 tc2_temp6_setpoint 193
wait 60

histmem mode time
histmem preset 3600

samplename semi_CO2_TBAB_5_193K_
for {set idx0 0} {$idx0 < 20} {incr idx0} {
	broadcast loop $idx0 semi_CO2_TBAB_5_193K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
