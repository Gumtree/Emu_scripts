 
histmem stop

# CF-12 H2 Lakeshore controller

hset /sample/tc2/sensor/setpoint1 50

# acquisition blocks of x/3600 hrs
set n_run 7
set run_time 1800
histmem mode time
histmem preset $run_time

samplename Niformate-hydrated_inel_cooling

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


#tertiary close
