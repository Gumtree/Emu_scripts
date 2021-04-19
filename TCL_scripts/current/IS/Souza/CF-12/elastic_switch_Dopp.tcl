 
histmem stop

# CF-12 H2 Mercury controller

samplename empty_el_ramp650to300K
hset /instrument/doppler/ctrl/run_cmd 0
wait 15
set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999
hset /sample/tc2/temp0/setpoint 300
runscan dummy_motor 10 14 75 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX}

tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF

