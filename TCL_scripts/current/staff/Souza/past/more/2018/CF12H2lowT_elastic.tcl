 
histmem stop

# CF-12 H2 Mercury controller
#tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF

#drive tc2_temp0_setpoint 50

samplename GOdry2018_el_baseTto300K

#hset /instrument/doppler/ctrl/run_cmd 0
#wait 15
#set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

#hset /sample/tc1/pres3/setpoint 6
tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:1.0
hset /sample/tc2/temp0/setpoint 300
runscan dummy_motor 10 14 130 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF

tertiary close
