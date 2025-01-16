histmem stop


# acquisition blocks of x/3600 hrs
set n_run 11
set run_time 3600
histmem mode time
histmem preset $run_time


# heating
samplename PBI(111)-340K_inel

hset /sample/tc3/control/pid_loop_1 10.0,0.9,0.0
wait 1

drive tc3_driveable 344

broadcast sicstime
wait 1800

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


