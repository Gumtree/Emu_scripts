histmem stop


# acquisition blocks of x/3600 hrs
set n_run 2
set run_time 3600
histmem mode time
histmem preset $run_time


# heating
samplename D2O-MPS-250K_inel

hset /sample/tc3/heater/heaterRange_2 0
wait 1
drive tc3_driveable2 180
hset /sample/tc3/heater/heaterRange_2 3 
wait 1

hset /sample/tc1/pres3/setpoint 8
wait 1
hset /sample/tc1/temp0/setpoint 250
wait 1
drive tc3_driveable2 250
wait 900

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


