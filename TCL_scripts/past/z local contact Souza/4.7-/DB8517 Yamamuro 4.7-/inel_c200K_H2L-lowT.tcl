histmem stop

# chopper Doppler config 
# (1:1 model only) set_chopper_config_with_roi 9.962 40.42 1 1000 0 50 0 255 0 999
#set_chopper_config_with_roi 9.962 20.21 1 1000 0 50 0 255 0 999
#wait 3
#hset /instrument/doppler/ctrl/run_cmd 1
#wait 3

# acquisition blocks of x/3600 hrs
set n_run 9
set run_time 3600
histmem mode time
histmem preset $run_time


# cooling
samplename D-TEA(sampleA)-200K_inel
hset /sample/tc1/temp0/setpoint 200
drive tc3_driveable 200
wait 900

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


