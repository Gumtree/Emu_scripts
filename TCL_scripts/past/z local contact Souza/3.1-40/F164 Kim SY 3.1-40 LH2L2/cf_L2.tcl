 
histmem stop

# cooling
hset /sample/tc1/pres3/setpoint 60
wait 1
hset /sample/tc1/temp0/setpoint 1
wait 1
hset /sample/tc3/heater/heaterRange_2 0
wait 1
drive tc3_driveable2 1
hset /sample/tc3/heater/heaterRange_2 3 
wait 1
hset /sample/tc1/pres3/setpoint 8
wait 1
hset /sample/tc1/temp0/setpoint 1
wait 1800

#tertiary close



