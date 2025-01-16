 
histmem stop

# cooling
hset /sample/tc1/pres3/setpoint 60
wait 1
hset /sample/tc1/temp0/setpoint 1
wait 1
hset /sample/tc3/heater/heaterRange_1 0
wait 1
drive tc3_driveable 150
hset /sample/tc3/heater/heaterRange_1 3 
wait 1
hset /sample/tc1/pres3/setpoint 8
wait 1
hset /sample/tc1/temp0/setpoint 150
#wait 900

#tertiary close



