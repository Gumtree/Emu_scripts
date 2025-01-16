
histmem stop

#VTI
hset /sample/tc1/pres7/setpoint 60
wait 1
hset /sample/tc3/heater/heaterRange_3 1
wait 1
hset /sample/tc3/sensor/setpoint3 200
wait 1

#H2L2
hset /sample/tc3/heater/heaterRange_1 3
wait 1
# PUT HELIUM IN CHAMBER DURING THE FOLLWING DRIVE
drive tc3_driveable 290

#VTI
hset /sample/tc1/pres7/setpoint 6
wait 1
# REMOVE HELIUM DURING THE FOLLOWING DRIVE
drive tc3_driveable3 290

