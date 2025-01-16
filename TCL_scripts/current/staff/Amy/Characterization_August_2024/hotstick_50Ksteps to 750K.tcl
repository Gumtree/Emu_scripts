#CF-15, 
#hot-stick
#empty can
#pumping
#heat shield, top-, bottom Tsensor
#script ~20 hrs
#
#
histmem stop

#Standard ramp setting for hot stick
hset /sample/tc1/control/ramp_Loop_3 1,5.0

#Set HEx temp to 300K
broadcast Target temperature = 300
drive tc1_driveable 300

#heating 300K - 750K (50K steps) [~10 hrs]
for {set idx0 0} {$idx0 <9} {incr idx0} {
	broadcast Target temperature = [expr $idx0*50+350]
	
	drive tc1_driveable3 [expr $idx0*50+350]
	wait 3600
}

#cooling as fast as possible to 300K (~8 hrs)
hset sample/tc1/sensor/setpoint3 300
hset sample/tc1/sensor/setpoint1 0


