histmem stop

#hset /instrument/doppler/ctrl/run_cmd 1
#wait 15
#set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
set n_runh 30
set run_time 1800
histmem mode time
histmem preset $run_time
samplename PEEP-polymer_inel_300K
for {set idx0 0} {$idx0 < $n_runh} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

