
histmem stop

wait 900


# Doppler settings
#hset /instrument/doppler/ctrl/run_cmd 0
#wait 1
# and histogram settings
#set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
#wait 2

samplename LacticDry-290K_He_el

runscan dummy_motor 10 14 1 time 300 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }


# Doppler settings
hset /instrument/doppler/ctrl/amplitude 75
wait 1
hset /instrument/doppler/ctrl/velocity 4.7
wait 1
hset /instrument/doppler/ctrl/run_cmd 1
wait 1
# and histogram settings 
set_chopper_config_with_roi 9.962 20.21 1 1000 0 50 0 255 0 999
wait 2

# acquisition blocks of x/3600 hrs
set n_run 10
set run_time 3600
histmem mode time
histmem preset $run_time

samplename LacticDry_290K_He_inel

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


# Doppler settings
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
# and histogram settings
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 2

samplename LacticDry-290K_He_el

runscan dummy_motor 10 14 1 time 300 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }



