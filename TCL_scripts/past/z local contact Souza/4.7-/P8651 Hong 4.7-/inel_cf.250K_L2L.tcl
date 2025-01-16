
histmem stop

# chopper Doppler config 
# (1:1 model only) set_chopper_config_with_roi 9.962 40.42 1 1000 0 50 0 255 0 999
#set_chopper_config_with_roi 12.333 20.21 1 1000 0 50 0 255 0 999
#wait 2
#hset /instrument/doppler/ctrl/run_cmd 1
#wait 1

# acquisition blocks of x/3600 hrs
set n_run 10
set run_time 3600
histmem mode time
histmem preset $run_time


samplename H-CYP-250K_inel

# fast cooling
hset /sample/tc1/pres3/setpoint 60
wait 1
hset /sample/tc1/temp0/setpoint 150
hset /sample/tc3/heater/heaterRange_2 0
wait 1
drive tc3_driveable2 260
hset /sample/tc1/temp0/setpoint 250
hset /sample/tc3/heater/heaterRange_2 3
wait 1
drive tc3_driveable2 250
hset /sample/tc1/pres3/setpoint 15
#wait 900

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


