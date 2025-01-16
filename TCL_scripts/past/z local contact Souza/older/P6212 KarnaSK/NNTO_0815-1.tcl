 
histmem stop

# CF-12 H2 Mercury controller



samplename Na2Ni2TeO6_at_600K


#21hrs
set n_run 36
set run_time 3600
histmem mode time
histmem preset $run_time
for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


#tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF

