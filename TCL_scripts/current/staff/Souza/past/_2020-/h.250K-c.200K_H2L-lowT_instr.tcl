
histmem stop

hset /sample/tc3/control/pid_Loop_1 10,2,0
wait 1
hset /sample/tc1/pres3/setpoint 15
wait 1
hset /sample/tc3/heater/heaterRange_1 3
wait 1
hset /sample/tc1/temp0/setpoint 250
wait 1
drive tc3_driveable 250
wait 3600

hset /sample/tc1/pres3/setpoint 60
wait 1
drive tc1_temp0_setpoint 200
wait 1
drive tc3_driveable 200
wait 3600

