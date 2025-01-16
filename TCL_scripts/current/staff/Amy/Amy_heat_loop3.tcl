#CF-15, cold-stick
#empty can
#exchange gas, pumping
#no heat shield, top-, bottom Tsensor



histmem stop
hset sample/tc1/heater/heaterRange_1 3 
hset sample/tc1/heater/heaterRange_2 3
#hset sample/tc1/heater/heaterRange_3 1

#cooling 300 - 3K
hset sample/tc1/sensor/setpoint1 0
hset sample/tc1/sensor/setpoint2 0
#hset sample/tc1/sensor/setpoint3 0

#wait 3600


#heating 0K - 150K

for {set idx0 0} {$idx0 <3} {incr idx0} {
	broadcast Target temperature = [expr $idx0*50+50]
	
	drive tc1_driveable [expr $idx0*50+50] tc1_driveable2 [expr $idx0*50+50]
	wait 3600
}

#heating 150K - 275K

for {set idx0 0} {$idx0 <5} {incr idx0} {
	broadcast Target temperature = [expr $idx0*25+175]
	
	drive tc1_driveable [expr $idx0*25+175] tc1_driveable2 [expr $idx0*25+175]
	wait 3600
}

#heating 280K - 325K

for {set idx0 0} {$idx0 <10} {incr idx0} {
	broadcast Target temperature = [expr $idx0*5+280]
	
	drive tc1_driveable [expr $idx0*5+280] tc1_driveable2 [expr $idx0*5+280]
	wait 3600
}

#cooling 325 - 3K
#hset sample/tc1/sensor/setpoint1 0
#hset sample/tc1/sensor/setpoint2 0

#wait 7200

#Ramp on 
hset /sample/tc1/control/ramp_Loop_1 1,1.0
hset /sample/tc1/control/ramp_Loop_2 1,1.0
wait 1
hset /sample/tc1/sensor/setpoint1 1
hset /sample/tc1/sensor/setpoint2 1
wait 1

wait 19000

hset /sample/tc1/sensor/setpoint1 325
hset /sample/tc1/sensor/setpoint2 325
wait 1

wait 19000

#off
hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0,1.0
wait 1
