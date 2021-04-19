 
histmem stop

# CF-12 VTI Mercury controller

drive tc2_temp0_setpoint 235

samplename GO-95%H2O_el_235to295K

#hset /instrument/doppler/ctrl/run_cmd 0
#wait 15
#set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

#hset /sample/tc1/pres3/setpoint 6
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:1.0
tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:1.0
hset /sample/tc1/temp0/setpoint 295
wait 3
hset /sample/tc2/temp0/setpoint 295

runscan dummy_motor 10 14 35 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF
tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF


#tertiary close
