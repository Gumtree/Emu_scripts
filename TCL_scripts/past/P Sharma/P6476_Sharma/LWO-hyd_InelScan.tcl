 
histmem stop

# CF-12 H2 Mercury controller
tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF

drive tc2_temp0_setpoint 320

samplename LWO_hyd_inel_320K_cooled
#hset /instrument/doppler/ctrl/run_cmd 1
wait 15
#set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
#8hrs
set n_run 2
set run_time 3600
histmem mode time
histmem preset $run_time
for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

drive tc2_temp0_setpoint 250

samplename LWO_hyd_inel_250K_cooled
#hset /instrument/doppler/ctrl/run_cmd 1
wait 60
#set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
#8hrs
set n_run 8
set run_time 3600
histmem mode time
histmem preset $run_time
for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


drive tc2_temp0_setpoint 2

samplename LWO_hyd_inel_2K_cooled
#hset /instrument/doppler/ctrl/run_cmd 1
wait 60
#set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
#8hrs
set n_run 18
set run_time 3600
histmem mode time
histmem preset $run_time
for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
