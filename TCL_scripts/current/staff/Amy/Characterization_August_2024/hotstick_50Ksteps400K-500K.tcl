#CF-15, 
#hot-stick
#empty can
#pumping
#heat shield, top-, bottom Tsensor
#script ~12 hrs

histmem stop

#Standard ramp setting for hot stick
hset /sample/tc1/control/ramp_Loop_3 1,5.0

#Start from 400K (~1 hr)
broadcast Target temperature = 400
drive tc1_driveable 300 tc1_driveable3 400
wait 3600

#heating 400K - 500K (50K steps) [~3 hrs]
for {set idx0 0} {$idx0 <2} {incr idx0} {
	broadcast Target temperature = [expr $idx0*50+450]
	
	drive tc1_driveable3 [expr $idx0*50+450]
	wait 3600
}

#cooling as fast as possible to 300K (~8 hrs)
hset sample/tc1/sensor/setpoint3 300
hset sample/tc1/sensor/setpoint1 0


