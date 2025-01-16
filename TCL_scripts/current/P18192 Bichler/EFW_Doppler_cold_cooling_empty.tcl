#CF-15, 

histmem stop

#ramp off
hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0,1.0
hset /sample/tc1/control/ramp_Loop_3 0,1.0
hset /sample/tc1/control/ramp_Loop_4 0,1.0
wait 1

#sample heater (cartridge or ring)
hset sample/tc1/heater/heaterRange_1 3 
#Cold puck
hset sample/tc1/heater/heaterRange_2 3
#Hot puck
hset sample/tc1/heater/heaterRange_3 0
#HEx heater
hset sample/tc1/heater/heaterRange_4 0
wait 1

#Doppler drive control
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999


#Make sure that stick is not too hot first
#drive tc1_driveable 300 tc1_driveable2 300
#wait 300

samplename vanadium_cooling_fixedWindow

# SET UP AND START TEMPERATURE RAMP
# ramp for HEX
hset /sample/tc1/control/ramp_loop_1 1,0.2
wait 1
hset /sample/tc1/sensor/setpoint1 138
wait 1
# ramp for sample 
hset /sample/tc1/control/ramp_loop_2 1,0.2
wait 1
hset /sample/tc1/sensor/setpoint2 138
wait 1

runscan dummy_motor 10 14 10 time 600 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

# SWITCH OFF TEMPERATURE RAMPS
# ramp for HEX
hset /sample/tc1/control/ramp_loop_1 0, 1.0
wait 1
hset /sample/tc1/control/ramp_loop_2 0, 1.0
wait 1

