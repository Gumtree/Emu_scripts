histmem stop

# CF-12 H2 Mercury controller

#Controling Doppler
hset /instrument/doppler/ctrl/run_cmd 1
wait 3
set_chopper_config_with_roi 9.962 20.21 1 1000 0 50 0 255 0 999
wait 3


#hset /sample/tc1/temp0/setpoint 250
#drive tc3_driveable 286
#drive tc1_temp0_setpoint 286

#wait 900 

# acquisition blocks of x/3600 hrs
set n_run 4
set run_time 3600
histmem mode time
histmem preset $run_time


samplename Tre_D2O_50%_inel_10K


for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
