#CF-15, cold-stick
#empty Emu can
#exchange gas
#no heat shield, top-, bottom Tsensor
histmem stop

#ramp off (default: always on at 5K/min for hot stick)
hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0,1.0
#hset /sample/tc1/control/ramp_Loop_3 1,5.0
hset /sample/tc1/control/ramp_Loop_4 0,1.0
wait 1

#HEx  
hset sample/tc1/heater/heaterRange_1 3 
#Cold puck
hset sample/tc1/heater/heaterRange_2 3
#Hot puck
#hset sample/tc1/heater/heaterRange_3 0

#Drive HEx and cold puck to 325K to start
drive tc1_driveable 325 tc1_driveable2 325
wait 3600

#ramp on (2K/min)
hset /sample/tc1/control/ramp_Loop_1 1,2.0
hset /sample/tc1/control/ramp_Loop_2 1,2.0
wait 1

#cooling to base temp at 2K/min
hset sample/tc1/sensor/setpoint1 0
hset sample/tc1/sensor/setpoint2 0

wait 14000
#########################################################
##heat puck to 325K at 2K/min
broadcast Target temperature = 325
drive tc1_driveable 325 tc1_driveable2 325
wait 3600
###########################################################
############################################################
#ramp on (1K/min)
hset /sample/tc1/control/ramp_Loop_1 1,1
hset /sample/tc1/control/ramp_Loop_2 1,1
wait 1

#cooling to base temp at 1K/min
hset sample/tc1/sensor/setpoint1 0
hset sample/tc1/sensor/setpoint2 0

wait 23000
#################################################################
##heat puck to 325K at 1K/min
broadcast Target temperature = 325
drive tc1_driveable 325 tc1_driveable2 325
wait 3600

###########################################################
############################################################
#ramp on (0.5K/min)
hset /sample/tc1/control/ramp_Loop_1 1,0.5
hset /sample/tc1/control/ramp_Loop_2 1,0.5
wait 1

#cooling to base temp at 0.5K/min
hset sample/tc1/sensor/setpoint1 0
hset sample/tc1/sensor/setpoint2 0

wait 42600
#################################################################
##heat puck to 325K at 0.5K/min
broadcast Target temperature = 325
drive tc1_driveable 325 tc1_driveable2 325
wait 3600
#################################################################
#########################################################

#ramp off (default: always on at 5K/min for hot stick)
hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0,1.0
#hset /sample/tc1/control/ramp_Loop_3 1,5.0
hset /sample/tc1/control/ramp_Loop_4 0,1.0
wait 1
