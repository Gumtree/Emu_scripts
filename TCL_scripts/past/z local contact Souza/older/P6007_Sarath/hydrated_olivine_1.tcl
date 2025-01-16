 
histmem stop

# CF-12 H2 Mercury controller

samplename Hyd_Oli_inel_373K
hset /instrument/doppler/ctrl/run_cmd 1
wait 15
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
#9hrs
set n_run 15
set run_time 1200
#histmem mode time
histmem preset $run_time
for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

samplename Hyd_Oli_el_373to423K
hset /instrument/doppler/ctrl/run_cmd 0
wait 15
set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999
hset /sample/tc1/pres3/setpoint 15
tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:0.50
hset /sample/tc2/temp0/setpoint 423
runscan dummy_motor 10 14 22 time 300 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }


samplename Hyd_Oli_inel_423K
hset /instrument/doppler/ctrl/run_cmd 1
wait 15
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
#9hrs
set n_run 27
set run_time 1200
#histmem mode time
histmem preset $run_time
for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}



samplename Hyd_Oli_el_423to473K
hset /instrument/doppler/ctrl/run_cmd 0
wait 15
set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999
hset /sample/tc1/pres3/setpoint 15
tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:0.50
hset /sample/tc2/temp0/setpoint 473
runscan dummy_motor 10 14 22 time 300 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }


samplename Hyd_Oli_inel_473K
hset /instrument/doppler/ctrl/run_cmd 1
wait 15
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
#9hrs
set n_run 27
set run_time 1200
#histmem mode time
histmem preset $run_time
for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


samplename Hyd_Oli_el_473to523K
hset /instrument/doppler/ctrl/run_cmd 0
wait 15
set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999
hset /sample/tc1/pres3/setpoint 20
tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:0.50
hset /sample/tc2/temp0/setpoint 523
runscan dummy_motor 10 14 22 time 300 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }


samplename Hyd_Oli_inel_523K
hset /instrument/doppler/ctrl/run_cmd 1
wait 15
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
#9hrs
set n_run 27
set run_time 1200
#histmem mode time
histmem preset $run_time
for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


samplename Hyd_Oli_el_523to573K
hset /instrument/doppler/ctrl/run_cmd 0
wait 15
set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999
hset /sample/tc1/pres3/setpoint 20
tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:0.50
hset /sample/tc2/temp0/setpoint 573
runscan dummy_motor 10 14 22 time 300 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }


samplename Hyd_Oli_inel_573K
hset /instrument/doppler/ctrl/run_cmd 1
wait 15
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
#9hrs
set n_run 27
set run_time 1200
#histmem mode time
histmem preset $run_time
for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


samplename Hyd_Oli_el_573to623K
hset /instrument/doppler/ctrl/run_cmd 0
wait 15
set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999
hset /sample/tc1/pres3/setpoint 25
tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:0.50
hset /sample/tc2/temp0/setpoint 623
runscan dummy_motor 10 14 22 time 300 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }


samplename Hyd_Oli_inel_623K
hset /instrument/doppler/ctrl/run_cmd 1
wait 15
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
#9hrs
set n_run 27
set run_time 1200
#histmem mode time
histmem preset $run_time
for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


samplename Hyd_Oli_el_623to673K
hset /instrument/doppler/ctrl/run_cmd 0
wait 15
set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999
hset /sample/tc1/pres3/setpoint 25
tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:0.50
hset /sample/tc2/temp0/setpoint 673
runscan dummy_motor 10 14 22 time 300 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }


samplename Hyd_Oli_inel_673K
hset /instrument/doppler/ctrl/run_cmd 1
wait 15
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
#9hrs
set n_run 27
set run_time 1200
#histmem mode time
histmem preset $run_time
for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


samplename Hyd_Oli_el_673to623K
hset /instrument/doppler/ctrl/run_cmd 0
wait 15
set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999
hset /sample/tc1/pres3/setpoint 25
tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:0.50
hset /sample/tc2/temp0/setpoint 623
runscan dummy_motor 10 14 22 time 300 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }


samplename Hyd_Oli_inel_623K
hset /instrument/doppler/ctrl/run_cmd 1
wait 15
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999

tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF

#9hrs
set n_run 27
set run_time 1200
#histmem mode time
histmem preset $run_time
for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}



#tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF

