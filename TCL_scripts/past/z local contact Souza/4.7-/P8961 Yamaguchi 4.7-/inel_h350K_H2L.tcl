histmem stop


#hset /instrument/doppler/ctrl/amplitude 75
#wait 1
#hset /instrument/doppler/ctrl/velocity 4.7
#wait 1
#hset /instrument/doppler/ctrl/run_cmd 1
#wait 1

# acquisition blocks of x/3600 hrs
set n_run 7
set run_time 3600
histmem mode time
histmem preset $run_time


# heating
samplename Mb-D2O-MPS-350K_inel


#hset /sample/tc1/temp0/setpoint 273
#wait 1
#drive tc3_driveable 270
#hset /sample/tc3/sensor/setpoint1 273

#wait 600

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


