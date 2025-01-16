#CF-15, cold-stick
#empty can
#exchange gas, pumping
#no heat shield, top-, bottom Tsensor
#script approx 55 hrs


histmem stop

#ramp off (ramp_Loop_3 to default 5K/min)
hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0,1.0
hset /sample/tc1/control/ramp_Loop_3 1,5.0
hset /sample/tc1/control/ramp_Loop_4 0,1.0
wait 1

#turn heaters on
hset sample/tc1/heater/heaterRange_1 3 
hset sample/tc1/heater/heaterRange_2 3
hset sample/tc1/heater/heaterRange_3 0
hset sample/tc1/heater/heaterRange_4 0

#wait at base temp [10mins]
wait 600

#heating as fast as possible to 325K [4hrs]
broadcast Target temperature = 325
drive tc1_driveable 325 tc1_driveable2 325
wait 3600

#cooling as fast as possible to base temp [2.5hrs]
hset sample/tc1/sensor/setpoint1 0
hset sample/tc1/sensor/setpoint2 0

wait 9000

#heating 0K - 300K (50K steps) [10 hrs]
for {set idx0 0} {$idx0 <6} {incr idx0} {
	broadcast Target temperature = [expr $idx0*50+50]
	
	drive tc1_driveable [expr $idx0*50+50] tc1_driveable2 [expr $idx0*50+50]
	wait 3600
}

#cooling 300K - 50K (50K steps) [8 hrs]
for {set idx0 0} {$idx0 <5} {incr idx0} {
	broadcast Target temperature = [expr 250-$idx0*50]
	
	drive tc1_driveable [expr 250-$idx0*50] tc1_driveable2 [expr 250-$idx0*50]
	wait 3600
}

#cooling 50K - 4K [1 hr]
hset sample/tc1/sensor/setpoint1 0
hset sample/tc1/sensor/setpoint2 0
wait 3600

#heating 225K - 325K (25K steps) [8hrs]
for {set idx0 0} {$idx0 <5} {incr idx0} {
	broadcast Target temperature = [expr $idx0*25+225]
	
	drive tc1_driveable [expr $idx0*25+225] tc1_driveable2 [expr $idx0*25+225]
	wait 3600
}

#cooling 325K - 225K (25K steps) [6hrs]
for {set idx0 0} {$idx0 <4} {incr idx0} {
	broadcast Target temperature = [300-expr $idx0*25]
	
	drive tc1_driveable [300-expr $idx0*25] tc1_driveable2 [300-expr $idx0*25]
	wait 3600
}

#5K step to 230K and back to 225K [3hrs]
broadcast Target temperature = 230
drive tc1_driveable 230 tc1_driveable2 230
wait 3600
drive tc1_driveable 225 tc1_driveable2 225
wait 3600


#heating 250K - 325K (3x5K steps, up and down) [12hrs]
for {set idx0 0} {$idx0 <4} {incr idx0} {
	broadcast Target temperature = [expr $idx0*25+245]
	
	drive tc1_driveable [expr $idx0*25+245] tc1_driveable2 [expr $idx0*25+245]
	wait 3600
	
	broadcast Target temperature = [expr $idx0*25+250]
	
	drive tc1_driveable [expr $idx0*25+250] tc1_driveable2 [expr $idx0*25+250]
	wait 3600
	
	broadcast Target temperature = [expr $idx0*25+245]
	
	drive tc1_driveable [expr $idx0*25+245] tc1_driveable2 [expr $idx0*25+245]
	wait 3600
}







