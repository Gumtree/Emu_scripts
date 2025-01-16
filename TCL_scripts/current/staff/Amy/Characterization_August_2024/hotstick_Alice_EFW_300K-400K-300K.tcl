#CF-15, hot-stick
#empty Emu can
#exchange no gas, pumping
#heat shield, top-, bottom Tsensor
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
hset sample/tc1/heater/heaterRange_2 0
#Hot puck
hset sample/tc1/heater/heaterRange_3 1

#Drive HEx and hot puck to 300K to start
drive tc1_driveable 300 tc1_driveable3 300
wait 3600

#ramp on (1K/min)
hset /sample/tc1/control/ramp_Loop_3 1,1.0
wait 1

#cooling to base temp at 2K/min
hset sample/tc1/sensor/setpoint3 400

wait 12000

#########################################################
##cool puck to 300K, no ramp
#ramp off 
hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0,1.0
hset /sample/tc1/control/ramp_Loop_3 0,1.0
hset /sample/tc1/control/ramp_Loop_4 0,1.0
wait 1

broadcast Target temperature = 300
hset /sample/tc1/sensor/setpoint1 5
drive tc1_driveable3 300
wait 600

###########################################################
############################################################
#Drive HEx and hot puck to 300K to start
drive tc1_driveable 300 tc1_driveable3 300
wait 3600

#ramp on (2K/min)
hset /sample/tc1/control/ramp_Loop_3 1,2.0
wait 1

#cooling to base temp at 2K/min
hset sample/tc1/sensor/setpoint3 400

wait 6000

#########################################################
##cool puck to 300K, no ramp
#ramp off 
hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0,1.0
hset /sample/tc1/control/ramp_Loop_3 0,2.0
hset /sample/tc1/control/ramp_Loop_4 0,1.0
wait 1

broadcast Target temperature = 300
hset /sample/tc1/sensor/setpoint1 3
drive tc1_driveable3 300
wait 600

#################################################################
#################################################################
#########################################################

#ramp off (default: always on at 5K/min for hot stick)
hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0,1.0
hset /sample/tc1/control/ramp_Loop_3 1,5.0
hset /sample/tc1/control/ramp_Loop_4 0,1.0
wait 1
