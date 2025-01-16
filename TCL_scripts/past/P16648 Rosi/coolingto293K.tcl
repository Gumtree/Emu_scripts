


# sample 
hset /sample/tc3/heater/heaterRange_1 0
wait 1
hset /sample/tc3/sensor/setpoint1 293
wait 1
# VTI
hset /sample/tc1/pres7/setpoint 30
wait 1
drive tc3_driveable3 293
hset /sample/tc1/pres7/setpoint 10
wait 1


