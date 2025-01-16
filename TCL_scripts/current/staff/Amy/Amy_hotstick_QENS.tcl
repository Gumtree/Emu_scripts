#CF-15, hot-stick
#empty can
#no exchange gas, pumping
#no heat shield, top-, bottom Tsensor
#copper lid+seal


histmem stop

#ramp off
#hset /sample/tc1/control/ramp_Loop_1 0,1.0
#hset /sample/tc1/control/ramp_Loop_2 0,1.0
#hset /sample/tc1/control/ramp_Loop_3 0,1.0
#hset /sample/tc1/control/ramp_Loop_4 0,1.0
#wait 1

#START SEQUENCE - controlling sample with cartridge, plus hot puck

#sample heater (cartridge or ring)
hset sample/tc1/heater/heaterRange_1 0 
#Cold puck
hset sample/tc1/heater/heaterRange_2 3
#HEx heater
hset sample/tc1/heater/heaterRange_3 0
#Nothing
hset sample/tc1/heater/heaterRange_4 1


#heating puck 100K (approx ? hrs)

for {set idx0 0} {$idx0 <3} {incr idx0} {
	broadcast Target temperature = [expr 300-$idx0*100]
	
	drive tc1_driveable2 [expr 300-$idx0*100] tc1_driveable4 [expr 300-$idx0*100]
	wait 3600
	broadcast msom = -90
	drive msom -90
	wait 600
	broadcast msom = 0
	drive msom 0
	wait 600
	broadcast msom = 90
	drive msom 90
	wait 600
	broadcast msom = -175
	drive msom -175
	wait 600
}


#END SEQUENCE  - estimated ? hrs

