#switch ramps off 
#hset /sample/tc3/control/ramp_Loop_1 0,1.0
#wait 1
#hset /sample/tc2/control/ramp_Loop_1 0,1.0
#wait 1 

hset /sample/tc1/pres3/setpoint 60
wait 1
#VTI temp control 
#hset /sample/tc3/sensor/setpoint1 150
#wait 1
#H1 centrestick temp control
#hset /sample/tc2/sensor/setpoint1 175
#wait 1
#hset /sample/tc2/heater/heaterRange_1 3
#wait 1