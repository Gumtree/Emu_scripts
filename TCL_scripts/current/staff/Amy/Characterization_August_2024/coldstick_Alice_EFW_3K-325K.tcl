#CF-15, cold-stick
#empty Emu can
#exchange gas
#no heat shield, top-, bottom Tsensor
histmem stop

#ramp off (default: always on at 5K/min for hot stick)
hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0,1.0
hset /sample/tc1/control/ramp_Loop_3 1,5.0
hset /sample/tc1/control/ramp_Loop_4 0,1.0
wait 1

#HEx  
hset sample/tc1/heater/heaterRange_1 3 
#Cold puck
hset sample/tc1/heater/heaterRange_2 3
#Hot puck
hset sample/tc1/heater/heaterRange_3 0

#################################################################
#################################################################
#################################################################

wait 7200
broadcast Target temperature = 325
#ramp on (0.5K/min)
hset /sample/tc1/control/ramp_Loop_1 1,0.5
hset /sample/tc1/control/ramp_Loop_2 1,0.5
wait 1

#heating to 325K temp at 0.5K/min
hset sample/tc1/sensor/setpoint1 325
hset sample/tc1/sensor/setpoint2 325

wait 40000

#########################################################
#########################################################
#########################################################

#ramp off (default: always on at 5K/min for hot stick)
hset /sample/tc1/control/ramp_Loop_1 0,0.5
hset /sample/tc1/control/ramp_Loop_2 0,0.5
hset /sample/tc1/control/ramp_Loop_3 1,5.0
hset /sample/tc1/control/ramp_Loop_4 0,1.0
wait 1
