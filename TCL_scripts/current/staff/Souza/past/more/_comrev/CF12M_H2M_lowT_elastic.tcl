 
histmem stop

# CF-12 L2 Mercury controller

# drive to 8K with heater off and pres at 60
# reduce pres to 6 and wait 1200
# hset to 1 and heater on
# wait thermal or drive to desired temp
#drive tc2_temp6_setpoint 50

#samplename methanol_el_baseTto300K
#hset /sample/tc1/pres3/setpoint 60
#hset /sample/tc1/temp0/setpoint 1
#drive tc2_temp0_setpoint 6.5
#hset /sample/tc2/temp0/setpoint 1
#hset /sample/tc1/pres3/setpoint 6

#wait 1200

hset /instrument/doppler/ctrl/run_cmd 0
wait 3
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 3

#wait 1800

#tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
#tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:0.5

samplename V_Cd_el

#hset /sample/tc2/temp0/setpoint 5
runscan dummy_motor 10 14 15 time 900 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

#tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF

#tertiary close
