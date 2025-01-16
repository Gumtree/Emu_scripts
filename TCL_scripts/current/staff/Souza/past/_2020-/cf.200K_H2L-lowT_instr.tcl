
histmem stop

# fast cooling and check undershoot

hset /sample/tc1/pres3/setpoint 60
wait 1
hset /sample/tc3/sensor/setpoint1 300
wait 1
drive tc1_temp0_setpoint 150
wait 1
drive tc3_driveable 300


hset /sample/tc3/control/pid_Loop_1 60,4,0
wait 1

hset /sample/tc3/heater/heaterRange_1 0
wait 1
drive tc3_driveable 210
hset /sample/tc1/temp0/setpoint 200
wait 1
hset /sample/tc3/heater/heaterRange_1 3
wait 1
drive tc3_driveable 200
hset /sample/tc1/pres3/setpoint 15

wait 3600


hset /sample/tc1/pres3/setpoint 60
wait 1
hset /sample/tc3/sensor/setpoint1 300
wait 1
drive tc1_temp0_setpoint 150
wait 1
drive tc3_driveable 300


hset /sample/tc3/control/pid_Loop_1 80,4,0
wait 1

hset /sample/tc3/heater/heaterRange_1 0
wait 1
drive tc3_driveable 210
hset /sample/tc1/temp0/setpoint 200
wait 1
hset /sample/tc3/heater/heaterRange_1 3
wait 1
drive tc3_driveable 200
hset /sample/tc1/pres3/setpoint 15

wait 3600


