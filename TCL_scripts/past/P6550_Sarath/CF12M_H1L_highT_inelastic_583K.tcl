histmem stop

# acquisition blocks of x/3600 hrs
set run_time 3772
histmem mode time
histmem preset $run_time

#CF-12 highT
#drive tc2_driveable 583
#wait 1800
#samplename PHG_583K_inel
set n_run 7
for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

tertiary close
hset /sample/tc1/pres3/setpoint 60
drive tc2_driveable 200