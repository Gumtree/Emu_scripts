histmem stop

# CF-12 H2 Mercury controller

hset /instrument/doppler/ctrl/run_cmd 0
wait 5
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 5

samplename xy_55_d2o_el_10Kto320K

tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:0.75
#tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
#tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:1.0
#hset /sample/tc1/temp0/setpoint 299.5
hset /sample/tc2/temp0/setpoint 320

runscan dummy_motor 10 14 425 time 60 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF
#tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF


#tertiary close
