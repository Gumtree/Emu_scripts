histmem stop


# acquisition blocks of x/3600 hrs
set n_run 8
set run_time 3600
histmem mode time
histmem preset $run_time


# heating
samplename PBI(111)-320K_inel


hset /sample/tc1/temp0/setpoint 315
wait 1
drive tc3_driveable 324

sicstime
wait 1800

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


