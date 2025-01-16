#CF-15, cold-stick
#empty can
#exchange gas, pumping
#no heat shield, top-, bottom Tsensor

histmem stop
#ring heater controlling sample
hset sample/tc1/heater/heaterRange_1 0
#cold puck
hset sample/tc1/heater/heaterRange_2 3
#HEx heater controlling HEx
hset sample/tc1/heater/heaterRange_3 1



#cooling 300K - 100K

for {set idx0 0} {$idx0 <5} {incr idx0} {
	broadcast Target temperature = [expr 300- $idx0*50]
	
	drive tc1_driveable2 [expr 300- $idx0*50] tc1_driveable3 [expr 300- $idx0*50]
	wait 3600
}

#heating 100K - 300K

for {set idx0 0} {$idx0 <5} {incr idx0} {
	broadcast Target temperature = [expr $idx0*50+100]
	
	drive tc1_driveable2 [expr $idx0*50+100] tc1_driveable3 [expr $idx0*50+100]  
	wait 3600
}


