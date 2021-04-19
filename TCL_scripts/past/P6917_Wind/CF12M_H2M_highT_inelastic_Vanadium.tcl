histmem stop

# chopper Doppler config example
# set_chopper_config_with_roi 6.366 20.21 1 1000 16 50 0 255 0 999
# set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999


# acquisition blocks of x/3600 hrs
set n_runl 5
set run_time 3600
histmem mode time
histmem preset $run_time

samplename Vanadium_3.0

for {set idx0 0} {$idx0 < $n_runl} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

# changing Doppler drive settings
hset /instrument/doppler/ctrl/run_cmd 0
hset /instrument/doppler/ctrl/velocity 4.7
wait 5
hset /instrument/doppler/ctrl/run_cmd 1
wait 5
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 5

set n_runl 18

samplename Vanadium_4.7



for {set idx0 0} {$idx0 < $n_runl} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
