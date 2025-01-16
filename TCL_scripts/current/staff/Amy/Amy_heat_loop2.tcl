#CF-15, cold-stick
#empty can
#exchange gas, pumping
#no heat shield, top-, bottom Tsensor


histmem stop
hset sample/tc1/heater/heaterRange_1 3 
hset sample/tc1/heater/heaterRange_2 3

#cooling 300 - 3K
#hset sample/tc1/sensor/setpoint1 0
#hset sample/tc1/sensor/setpoint2 0

#wait 14400


#heating 0K - 150K

for {set idx0 0} {$idx0 <1} {incr idx0} {
	broadcast Target temperature = [expr $idx0*50+100]
	
	drive tc1_driveable [expr $idx0*50+100] tc1_driveable2 [expr $idx0*50+100]
	wait 3600
}
