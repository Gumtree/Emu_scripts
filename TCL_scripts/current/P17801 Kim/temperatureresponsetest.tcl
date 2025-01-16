
histmem stop

#wait 1200

hset /sample/tc1/heater/heaterRange_1 3
wait 1
hset /sample/tc1/control/ramp_loop_3 1, 5.0
wait 1
hset /sample/tc1/heater/heaterRange_3 1
wait 1

drive tc1_driveable3 410 tc1_driveable 325

wait 3600

# SET UP AND START TEMPERATURE RAMP
# ramp for sample 
hset /sample/tc1/control/ramp_loop_3 1,1.0
wait 1
hset /sample/tc1/sensor/setpoint3 430
wait 1


