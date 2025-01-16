#CF-15, cold-stick
#empty can
#exchange gas
#no heat shield, top-, bottom Tsensor
#Cold stick shortened by 95.65mm
  
histmem stop
hset sample/tc1/heater/heaterRange_1 3 
hset sample/tc1/heater/heaterRange_2 3

#heating 100K - 300K

for {set idx0 0} {$idx0 <3} {incr idx0} {
	broadcast Target temperature = [expr $idx0*100+100]
	
	drive tc1_driveable [expr $idx0*100+100]
	wait 1800
}

#heating 300K - 330K

for {set idx0 0} {$idx0 <4} {incr idx0} {
	broadcast Target temperature = [expr $idx0*10+300]
	
	drive tc1_driveable [expr $idx0*10+300]  
	wait 1800
}

#heating 335K - 365K

for {set idx0 0} {$idx0 <7} {incr idx0} {
	broadcast Target temperature = [expr $idx0*5+335]
	
	drive tc1_driveable [expr $idx0*5+335] 
	wait 1800
}



