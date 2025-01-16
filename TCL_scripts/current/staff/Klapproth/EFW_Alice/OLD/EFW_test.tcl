
histmem stop


hset instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999
wait 1

samplename empty_cryo-stick_RT
runscan dummy_motor 10 14 12 time 3600 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX }


###################################################################################
hset instrument/doppler/ctrl/run_cmd 1
wait 1
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 1

histmem mode time
histmem preset 3600


samplename empty_cryo-stick_RT
for {set idx0 0} {$idx0 <20} {incr idx0} {
	broadcast loop $idx0 samplename empty_cryo-stick_RT
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
