
#set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

#L2

hset /sample/tc1/pres3/setpoint 15
tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RENA:ON
tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RSET:0.4
hset /sample/tc2/temp6/setpoint 300

runscan dummy_motor 10 14 155 time 300 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RENA:OFF


samplename empty_inel_300K

hset /instrument/doppler/ctrl/run_cmd 1
wait 5
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 5

set n_run 14
set run_time 3600
histmem mode time
histmem preset $run_time

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

