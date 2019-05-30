 
histmem stop

# CF-12 H2 Mercury controller


samplename Na2Ni2TeO6_at_200K
#hset /instrument/doppler/ctrl/run_cmd 1
#wait 15
#set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
#drive tc2_temp0_setpoint
#5hrs
set n_run 5
set run_time 3600
histmem mode time
histmem preset $run_time
for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

samplename Na2Ni2TeO6_at_250K
#hset /instrument/doppler/ctrl/run_cmd 1
#wait 15
#set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
drive tc2_temp0_setpoint 250
wait 300
#21hrs
set n_run 21
set run_time 3600
histmem mode time
histmem preset $run_time
for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}





#samplename Na2Ni2TeO6_cooling_el_300tobaseT
#hset /instrument/doppler/ctrl/run_cmd 0
#wait 15
#set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999
#hset /sample/tc1/pres3/setpoint 60
#tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
#tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:0.50
#hset /sample/tc2/temp0/setpoint 1
#runscan dummy_motor 10 14 55 time 300 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }


#tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF

