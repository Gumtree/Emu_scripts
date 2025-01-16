
histmem stop

# Doppler settings


# chopper and Doppler histogram configuration 


#wait 900

# acquisition blocks of x/3600 hrs
set n_run 3
set run_time 1800
histmem mode time
histmem preset $run_time

samplename NVP0eutect_300K

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


