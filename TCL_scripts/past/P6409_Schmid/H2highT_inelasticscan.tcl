histmem stop

# chopper Doppler config example
# set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
# set_chopper_config_with_roi 9.962 40.42 1 1000 16 50 0 255 0 999

#CF-12 highT
#drive tc2_temp0_setpoint 600
#wait 900

#samplename LNMRTO_ht_AH_600K_el
#runscan dummy_motor 10 14 3 time 300 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

hset /instrument/doppler/ctrl/run_cmd 1
wait 15
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999

# acquisition blocks of x/3600 hrs
set n_run 60
set run_time 3600
histmem mode time
histmem preset $run_time

samplename LNMRTO_ht_AH_650K_inel
for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

