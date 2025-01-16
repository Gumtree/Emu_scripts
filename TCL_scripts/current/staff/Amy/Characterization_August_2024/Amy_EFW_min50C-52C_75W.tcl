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


#Drive HEx and cold puck to 223K to start
#drive tc1_driveable 223 tc1_driveable2 223
#wait 3600

#Drive to 325K
#drive tc1_driveable 325 tc1_driveable2 325
wait 3600

#Drive back to 223K
drive tc1_driveable 223 tc1_driveable2 223
wait 3600

#ramp on (2K/min)
hset /sample/tc1/control/ramp_Loop_1 1,2.0
hset /sample/tc1/control/ramp_Loop_2 1,2.0
wait 1

#heat puck to 325K at 2K/min
broadcast Target temperature = 325
drive tc1_driveable 325 tc1_driveable2 325
wait 600

#cool back to 223K at 2K/min
broadcast Target temperature = 223
drive tc1_driveable 223 tc1_driveable2 223
wait 600

#ramp on (1K/min)
hset /sample/tc1/control/ramp_Loop_1 1,1
hset /sample/tc1/control/ramp_Loop_2 1,1
wait 1

#heat puck to 325K at 1K/min
broadcast Target temperature = 325
drive tc1_driveable 325 tc1_driveable2 325
wait 600

#cool back to 223K at 1K/min
broadcast Target temperature = 223
drive tc1_driveable 223 tc1_driveable2 223
wait 600

#cool to 1K at 1K/min
broadcast Target temperature = 1
drive tc1_driveable 1 tc1_driveable2 1

#ramp off (default: always on at 5K/min for hot stick)
hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0,1.0
hset /sample/tc1/control/ramp_Loop_3 1,5.0
hset /sample/tc1/control/ramp_Loop_4 0,1.0
wait 1
