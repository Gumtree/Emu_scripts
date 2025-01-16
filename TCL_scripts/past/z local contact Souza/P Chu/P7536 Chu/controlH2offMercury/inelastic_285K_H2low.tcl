histmem stop

# CF-12 H2 Mercury controller

#hset /instrument/doppler/ctrl/run_cmd 1
#wait 5
#set_chopper_config_with_roi 9.962 20.21 1 1000 0 50 0 255 0 999
#wait 5

# acquisition blocks of x/3600 hrs
set n_run 10
set run_time 3600
histmem mode time
histmem preset $run_time

samplename xy_55_d2o_285K_inel


drive tc2_temp0_setpoint 285
wait 600

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
