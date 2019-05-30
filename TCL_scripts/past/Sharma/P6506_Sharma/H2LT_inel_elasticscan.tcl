
histmem stop

#set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

#H2

samplename hydNaMnO2_inel_1p7K

drive tc2_temp0_setpoint 10
hset /sample/tc1/pres3/setpoint 6
drive tc2_temp0_setpoint 1.7

set n_run 12
set run_time 3600
histmem mode time
histmem preset $run_time

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


samplename hydNaMnO2_el_baseto363K

hset /instrument/doppler/ctrl/run_cmd 0
wait 5
set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999
wait 5

hset /sample/tc1/pres3/setpoint 15
tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:0.4
hset /sample/tc2/temp0/setpoint 363

runscan dummy_motor 10 14 182 time 300 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF

