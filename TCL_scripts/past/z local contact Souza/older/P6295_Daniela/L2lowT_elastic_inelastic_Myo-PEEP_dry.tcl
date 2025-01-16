histmem stop

drive tc2_temp6_setpoint 20


#for L2

hset /instrument/doppler/ctrl/run_cmd 0
wait 15
set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999


tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RENA:ON
tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RSET:2.0

samplename Myo-PEEP-1-5-HW-dry_el_20to120K
hset /sample/tc2/temp6/setpoint 120
runscan dummy_motor 10 14 17 time 180 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RSET:1

samplename Myo-PEEP-1-5-HW-dry_el_120to300K
hset /sample/tc2/temp6/setpoint 300
runscan dummy_motor 10 14 80 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RENA:OFF

hset /instrument/doppler/ctrl/run_cmd 1
wait 15
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
set n_runh 30
set run_time 3600
histmem mode time
histmem preset $run_time
samplename Myo-PEEP-1-5-HW-dry_inel_300K
for {set idx0 0} {$idx0 < $n_runh} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

