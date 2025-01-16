
histmem stop

# acquisition blocks of x/3600 hrs
set n_run 4
set run_time 3600
histmem mode time
histmem preset $run_time

#hset /instrument/doppler/ctrl/run_cmd 0
#wait 1
#hset /instrument/doppler/ctrl/amplitude 75
#wait 1
#hset /instrument/doppler/ctrl/velocity 4.7
#wait 1
#hset /instrument/doppler/ctrl/run_cmd 1
#wait 1

# chopper and Doppler histogram configuration 
# (1:1 mode only) set_chopper_config_with_roi 9.962 40.42 1 1000 0 50 0 255 0 999
#set_chopper_config_with_roi 9.962 20.21 1 1000 0 50 0 255 0 999
#wait 2

samplename PBI(111)-320K_inel

#wait 900 

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


