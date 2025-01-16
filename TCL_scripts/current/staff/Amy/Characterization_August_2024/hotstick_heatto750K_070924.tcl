#CF-15, 
#hot-stick
#empty can
#pumping
#heat shield, top-, bottom Tsensor
#script ~20 hrs

histmem stop

#ramp off (ramp_Loop_3 to default 5K/min)
hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0,1.0
hset /sample/tc1/control/ramp_Loop_3 1,5.0
hset /sample/tc1/control/ramp_Loop_4 0,1.0
wait 1

#Make sure temp is at 300K
broadcast Target temperature = 300
drive tc1_driveable3 300

#heating as fast as possible to 750K [7.5hrs?]
broadcast Target temperature = 750
drive tc1_driveable3 750

#wait for 8 hrs
wait 30000

#cooling as fast as possible to 300K (~12 hrs)
drive tc1_driveable3 300


