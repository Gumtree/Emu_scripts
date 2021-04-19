histmem stop

hset /instrument/doppler/ctrl/run_cmd 0
wait 15
set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

#for H2
drive tc2_temp0_setpoint 300

#tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
#tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:2.0

samplename empty_el_300K
#hset /sample/tc2/temp0/setpoint 120
runscan dummy_motor 10 14 3 time 600 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

#tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:1

#tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF

hset /instrument/doppler/ctrl/run_cmd 1
wait 15
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
set n_runh 30
set run_time 3600
histmem mode time
histmem preset $run_time
samplename empty_inel_300K
for {set idx0 0} {$idx0 < $n_runh} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

