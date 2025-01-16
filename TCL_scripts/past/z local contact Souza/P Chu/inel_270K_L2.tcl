histmem stop

# CF-12 L2 Mercury controller

# Controlling Doppler
#hset /instrument/doppler/ctrl/run_cmd 1
#wait 3
#set_chopper_config_with_roi 9.962 20.21 1 1000 0 50 0 255 0 999
#wait 3

#hset /sample/tc1/temp0/setpoint 270
#drive tc2_temp6_setpoint 270


# acquisition blocks of x/3600 hrs
set n_run 1
set run_time 5100
histmem mode time
histmem preset $run_time 
 


#wait 600 


samplename GO8nm0p58mg_qens_270K



for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

