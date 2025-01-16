histmem stop

# CF-12 H2 Mercury controller

#Contorling Dopper
#hset /instrument/doppler/ctrl/run_cmd 1
#wait 5
#set_chopper_config_with_roi 9.962 20.21 1 1000 0 50 0 255 0 999
#wait 5

#Controlling Temperature 
hset /sample/tc1/temp0/setpoint 300
#hset /sample/tc3/sensor/setpoint1 300
