#CF-15, 
#hot-stick
#empty can
#pumping
#heat shield, top-, bottom Tsensor
#script ~22 hrs
#
histmem stop

#ramp off
hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0,1.0
hset /sample/tc1/control/ramp_Loop_3 1,5.0
hset /sample/tc1/control/ramp_Loop_4 0,1.0
wait 1

#Make sure temp is at 300K
broadcast Target temperature = 300
drive tc1_driveable3 300

#wait at base temp [10mins]
wait 600

#5K step to 305K [1hrs]
broadcast Target temperature = 305
drive tc1_driveable3 305 
wait 3600


#heating 300K - 400K (3x5K steps, up and down) [?hrs]
for {set idx0 0} {$idx0 <2} {incr idx0} {
	broadcast Target temperature = [expr $idx0*50+350]
	
	drive tc1_driveable3 [expr $idx0*50+350] 
	wait 3600
	
	broadcast Target temperature = [expr $idx0*50+355] 
	
	drive tc1_driveable3 [expr $idx0*50+355] 
	wait 3600
	
	broadcast Target temperature = [expr $idx0*50+350]
	
	drive tc1_driveable3 [expr $idx0*50+350] 
	wait 3600
}


#cooling as fast as possible to 300K (~8 hrs)
hset sample/tc1/sensor/setpoint3 300

#wait ~12 hrs
wait 43200
