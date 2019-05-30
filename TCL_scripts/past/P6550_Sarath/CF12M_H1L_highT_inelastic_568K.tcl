histmem stop

# acquisition blocks of x/3600 hrs
set run_time 3600
histmem mode time
histmem preset $run_time

#CF-12 highT
drive tc2_driveable 568
wait 1800
samplename PHG_568K_inel
set n_run 16
for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

