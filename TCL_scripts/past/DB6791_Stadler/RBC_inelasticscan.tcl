histmem stop

# chopper Doppler config example
# Doppler drive 3m/s 40mm
# set_chopper_config_with_roi 11.939 20.21 1 1000 16 50 0 255 0 999

# acquisition blocks of x/3600 hrs
set n_runl 50
set run_time 3600
histmem mode time
histmem preset $run_time

#CF-12 highT stick
samplename Monensin_backto298K_inel
for {set idx0 0} {$idx0 < $n_runl} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

