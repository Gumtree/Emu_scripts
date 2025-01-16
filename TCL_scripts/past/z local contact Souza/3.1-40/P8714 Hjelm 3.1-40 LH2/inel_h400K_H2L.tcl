histmem stop


# acquisition blocks of x/3600 hrs
set n_run 12
set run_time 3600
histmem mode time
histmem preset $run_time


# heating
samplename PBI(111)-400K_inel


drive tc3_driveable 407

sicstime
wait 1800

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


tertiary close