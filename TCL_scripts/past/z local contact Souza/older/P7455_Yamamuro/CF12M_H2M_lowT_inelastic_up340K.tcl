histmem stop


# using Doppler frequency 9.962 Hz (energy range +/- 31 ueV)
#hset /instrument/doppler/ctrl/run_cmd 1
#wait 15
#set_chopper_config_with_roi 9.962 20.21 1 1000 0 50 0 255 0 999
#wait 15


# acquisition blocks of x/3600 hrs
set n_runl 24
set run_time 3600
histmem mode time
histmem preset $run_time


samplename PdPtH_inel_340K
#hset /sample/tc1/temp0/setpoint 249.5
#drive tc2_temp0_setpoint 340
#wait 1200

for {set idx0 0} {$idx0 < $n_runl} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


