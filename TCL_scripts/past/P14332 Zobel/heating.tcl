
histmem stop

#H2L2
hset /sample/tc3/heater/heaterRange_1 3
wait 1
hset /sample/tc3/sensor/setpoint1 345
wait 1

#VTI
hset /sample/tc3/heater/heaterRange_3 1
wait 1
drive tc3_driveable3 315

#VTI
drive tc3_driveable 350
