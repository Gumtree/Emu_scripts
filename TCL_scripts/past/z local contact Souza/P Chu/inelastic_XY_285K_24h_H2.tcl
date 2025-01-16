histmem stop

# CF-12 L2 Mercury controller

# Controlling Doppler
#hset /instrument/doppler/ctrl/run_cmd 1
#wait 3
#set_chopper_config_with_roi 9.962 20.21 1 1000 0 50 0 255 0 999
#wait 3

#Talk to L2
#hset /sample/tc1/temp0/setpoint 285
#drive tc2_temp6_setpoint 285

#Talk to H2
hset /sample/tc1/temp0/setpoint 285
drive tc3_driveable 285


# acquisition blocks of x/3600 hrs
set n_run 24
set run_time 3600
histmem mode time
histmem preset $run_time 
 


#wait 600 


samplename XY_PH8_EN_285K_24h



for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

