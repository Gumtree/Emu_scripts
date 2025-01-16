#CF-15, hot-stick
#empty can
#no exchange gas, pumping
#no heat shield, top-, bottom Tsensor
#copper lid+seal


histmem stop

#ramp off
hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0,1.0
hset /sample/tc1/control/ramp_Loop_3 0,1.0
hset /sample/tc1/control/ramp_Loop_4 0,1.0
wait 1



#sample heater (cartridge or ring)
hset sample/tc1/heater/heaterRange_1 3 
#Cold puck
hset sample/tc1/heater/heaterRange_2 0
#Hot puck
hset sample/tc1/heater/heaterRange_3 1
#HEx heater
hset sample/tc1/heater/heaterRange_4 0

#Make sure that stick is not too hot first
drive tc1_driveable3 300 
wait 1

#ramp on (1K/min)
hset /sample/tc1/control/ramp_Loop_3 1,1.0
wait 1

#heat puck to 700K at 1K/min
broadcast Target temperature = 700

drive tc1_driveable3 700
wait 600

#cool back to 300K at 1K/min
broadcast Target temperature = 300
drive tc1_driveable3 300
wait 600

