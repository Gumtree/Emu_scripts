
histmem stop

#VTI
hset /sample/tc1/pres7/setpoint 60
wait 1
hset /sample/tc3/heater/heaterRange_3 1
wait 1
hset /sample/tc3/sensor/setpoint3 1
wait 1

#H2L2
hset /sample/tc3/heater/heaterRange_1 3
wait 1
hset /sample/tc3/sensor/setpoint1 1
wait 1
