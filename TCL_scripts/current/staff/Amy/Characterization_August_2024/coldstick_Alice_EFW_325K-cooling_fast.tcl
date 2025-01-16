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


#Drive HEx and cold puck to 325K to start
drive tc1_driveable 325 tc1_driveable2 325
wait 3600

#cooling to base temp as fast as possible
hset sample/tc1/sensor/setpoint1 0
hset sample/tc1/sensor/setpoint2 0



#################################################################
#################################################################
#################################################################

#ramp off (default: always on at 5K/min for hot stick)
hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0,1.0
hset /sample/tc1/control/ramp_Loop_3 1,5.0
hset /sample/tc1/control/ramp_Loop_4 0,1.0
wait 1
