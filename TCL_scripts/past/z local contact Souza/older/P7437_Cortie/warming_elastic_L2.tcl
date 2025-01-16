 
histmem stop

# CF-12 L2 Mercury controller

samplename USN_Al40_el_baseTo300K

hset /instrument/doppler/ctrl/run_cmd 0
wait 5
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 5

tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RENA:ON
tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RSET:0.5

hset /sample/tc1/pres3/setpoint 60

hset /sample/tc2/temp6/setpoint 300
runscan dummy_motor 10 14 245 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RENA:OFF

#tertiary close
