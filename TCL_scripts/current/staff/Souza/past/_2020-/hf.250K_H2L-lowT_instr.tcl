
histmem stop

#wait 2000

hset /sample/tc3/control/pid_Loop_1 10,2,0
wait 1
hset /sample/tc1/pres3/setpoint 15
wait 1
hset /sample/tc3/heater/heaterRange_1 3
wait 1
hset /sample/tc1/temp0/setpoint 250
wait 1
drive tc3_driveable 230
hset /sample/tc3/control/ramp_loop_1 1,1.0
wait 1
hset /sample/tc3/sensor/setpoint1 250
wait 1200
hset /sample/tc3/control/ramp_loop_1 0,1.0
wait 1
sicstime
wait 3600

hset /sample/tc1/pres3/setpoint 60
wait 1
drive tc1_temp0_setpoint 200
wait 1
drive tc3_driveable 200
wait 300



hset /sample/tc3/control/pid_Loop_1 5,2,0
wait 1
hset /sample/tc1/pres3/setpoint 15
wait 1
hset /sample/tc3/heater/heaterRange_1 3
wait 1
hset /sample/tc1/temp0/setpoint 250
wait 1
drive tc3_driveable 230
hset /sample/tc3/control/ramp_loop_1 1,1.0
wait 1
hset /sample/tc3/sensor/setpoint1 250
wait 1200
hset /sample/tc3/control/ramp_loop_1 0,1.0
wait 1
sicstime
wait 3600

hset /sample/tc1/pres3/setpoint 60
wait 1
drive tc1_temp0_setpoint 200
wait 1
drive tc3_driveable 200
wait 300



hset /sample/tc3/control/pid_Loop_1 10,4,0
wait 1
hset /sample/tc1/pres3/setpoint 15
wait 1
hset /sample/tc3/heater/heaterRange_1 3
wait 1
hset /sample/tc1/temp0/setpoint 250
wait 1
drive tc3_driveable 230
hset /sample/tc3/control/ramp_loop_1 1,1.0
wait 1
hset /sample/tc3/sensor/setpoint1 250
wait 1200
hset /sample/tc3/control/ramp_loop_1 0,1.0
wait 1
sicstime
wait 3600

hset /sample/tc1/pres3/setpoint 60
wait 1
drive tc1_temp0_setpoint 200
wait 1
drive tc3_driveable 200
wait 300

