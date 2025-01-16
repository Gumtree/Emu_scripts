 
histmem stop

drive tc1_temp0_setpoint 1.6 tc2_temp6_setpoint 1.6
#hset /sample/tc1/pres3/setpoint 50

#wait 120
#drive tc1_temp0_setpoint 295 tc2_temp6_setpoint 300

hset /instrument/doppler/ctrl/run_cmd 0
wait 3
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 3


samplename Emim-FeBr4_heating


#Ramp for cryo
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:1.0
hset /sample/tc1/temp0/setpoint 12

#Ramp for samplestick
tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RENA:ON
tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RSET:1.0
hset /sample/tc2/temp6/setpoint 12

runscan dummy_motor 10 14 6 time 120 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

###############################################################################



############################################################################################
#hset /sample/tc1/pres3/setpoint 6
drive tc1_temp0_setpoint 12 tc2_temp6_setpoint 12
wait 120 

#hset /instrument/doppler/ctrl/run_cmd 0
#wait 3
#set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
#wait 3


samplename Emim_FeBr4_heating


#Ramp for cryo
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:1.0
hset /sample/tc1/temp0/setpoint 300

#Ramp for samplestick
tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RENA:ON
tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RSET:1.0
hset /sample/tc2/temp6/setpoint 325

runscan dummy_motor 10 7 157 time 120 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }



tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF
tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RENA:OFF

####################################################################################




 

#tertiary close
