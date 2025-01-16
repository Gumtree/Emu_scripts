 
histmem stop

# CF-12 L2 Mercury controller

# drive to 8K with heater off and pres at 60
# reduce pres to 6 and wait 1200
# hset to 1 and heater on
# wait thermal or drive to desired temp
#drive tc2_temp6_setpoint 50

samplename tol_el_baseTto100K

hset /instrument/doppler/ctrl/run_cmd 0
wait 15
set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

#wait 1200

#hset /sample/tc1/pres3/setpoint 6
tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RENA:ON
tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RSET:1.0
hset /sample/tc2/temp6/setpoint 100
runscan dummy_motor 10 14 40 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RENA:OFF

#tertiary close
