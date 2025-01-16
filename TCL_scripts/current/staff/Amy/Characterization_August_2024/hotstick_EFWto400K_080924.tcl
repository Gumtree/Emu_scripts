#CF-15, 
#hot-stick
#empty can
#pumping
#heat shield, top-, bottom Tsensor
#script takes about 10hrs
#Need to adjust to either 1K/min or 2K/min

histmem stop

#ramp off
hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0,1.0

#Adjust loop3 as 1 or 2 K/min as necessary
hset /sample/tc1/control/ramp_Loop_3 1,1.0
hset /sample/tc1/control/ramp_Loop_4 0,1.0
wait 1

#Make sure HEx is at 300K
#drive tc1_driveable 300

#Start with hot stick at 300K
drive tc1_driveable3 300

#heat to 400K (~2 hrs/~1 hr)
broadcast Target temperature = 400
drive tc1_driveable3 400
wait 7200

#cooling to 300K (~8 hrs)
hset sample/tc1/sensor/setpoint3 300

#wait ~12 hrs
wait 43200

#ramp back to default
hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0,1.0
hset /sample/tc1/control/ramp_Loop_3 1,5.0
hset /sample/tc1/control/ramp_Loop_4 0,1.0
wait 1