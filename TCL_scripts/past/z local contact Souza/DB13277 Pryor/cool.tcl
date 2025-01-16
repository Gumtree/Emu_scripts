 
#histmem stop

#hset /instrument/doppler/ctrl/run_cmd 0
#wait 1
#set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
#wait 2

hset /sample/tc1/pres7/setpoint 60
wait 1


hset /sample/tc3/sensor/setpoint3 250
wait 1
drive tc3_driveable 250

hset /sample/tc1/pres7/setpoint 6
wait 1

#wait 900

#tertiary close

