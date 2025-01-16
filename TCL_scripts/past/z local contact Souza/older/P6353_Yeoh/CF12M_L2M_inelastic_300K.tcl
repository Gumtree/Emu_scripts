histmem stop

hset /instrument/doppler/ctrl/run_cmd 1
wait 15
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 15

# acquisition blocks of x/3600 hrs
set n_runl 15
set run_time 3600
histmem mode time
histmem preset $run_time

samplename PDMS-Surf_inel_300K

#drive tc2_temp6_setpoint 298
#wait 1800

for {set idx0 0} {$idx0 < $n_runl} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


