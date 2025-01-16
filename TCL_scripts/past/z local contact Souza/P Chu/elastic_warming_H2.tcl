 
histmem stop

#doppler driver control
#hset /instrument/doppler/ctrl/run_cmd 0
#wait 3
#set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
#wait 3


samplename XY_EN_denat_ELASTIC_warming


#Ramp for cryo
#tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
#tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:1.0
hset /sample/tc1/temp0/setpoint 315

#Ramp for samplestick
#hset /sample/tc3/control/ramp_loop_1 1,1.0
hset /sample/tc3/sensor/setpoint1 320

runscan dummy_motor 10 14 310 time 60 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }


#switch off ramp
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF
hset /sample/tc3/control/ramp_loop_1 0,1.0



#tertiary close
