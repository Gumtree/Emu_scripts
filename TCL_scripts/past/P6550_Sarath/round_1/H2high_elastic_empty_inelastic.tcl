 
histmem stop


#samplename empty_el_295to650K
#hset /instrument/doppler/ctrl/run_cmd 0
#wait 15
#set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999
#hset /sample/tc1/pres3/setpoint 60
#tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
#tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:0.27
#hset /sample/tc2/temp0/setpoint 650
#runscan dummy_motor 10 14 270 time 300 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

#tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF

#drive tc2_temp0_setpoint 500

#samplename empty_inel_500K
#hset /instrument/doppler/ctrl/run_cmd 1
#wait 900
#set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
#7hrs
set n_run 7
set run_time 3600
histmem mode time
histmem preset $run_time
for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

drive tc2_temp0_setpoint 450

samplename empty_inel_450K
#hset /instrument/doppler/ctrl/run_cmd 1
wait 900
#set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
#14.67hrs
set n_run 12
set run_time 4400
histmem mode time
histmem preset $run_time
for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


drive tc2_temp0_setpoint 300

samplename empty_inel_300K
#hset /instrument/doppler/ctrl/run_cmd 1
wait 900
#set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
#_hrs
set n_run 50
set run_time 4400
histmem mode time
histmem preset $run_time
for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}



#switch Doppler off
#set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999
#histmem mode unlimited
#histmem start
#histmem stop
#newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T
#save



