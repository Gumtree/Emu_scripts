 
histmem stop

#hset /instrument/doppler/ctrl/run_cmd 0
#wait 1
#set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
#wait 2


samplename ECr-15to310K_el

hset /sample/tc1/temp0/setpoint 1
wait 1
drive tc3_driveable2 15
hset /sample/tc1/pres3/setpoint 15
wait 1
hset /sample/tc1/temp0/setpoint 15
wait 900

#Ramp for cryo
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
wait 1
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:1.0
wait 1
hset /sample/tc1/temp0/setpoint 310
#Ramp for samplestick
hset /sample/tc3/control/ramp_loop_2 1,1.0
wait 1
hset /sample/tc3/sensor/setpoint2 310
wait 1

runscan dummy_motor 10 14 305 time 60 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF
hset /sample/tc3/control/ramp_loop_2 0,1.0


#tertiary close
