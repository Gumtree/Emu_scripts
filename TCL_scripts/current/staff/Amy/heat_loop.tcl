#CF-12, hot-stick
#empty can
#no exchange gas, pumping
#heat shield, top-, bottom Tsensor


histmem stop

#cooling 40 - 3K

hset sample/tc1/sensor/setpoint1 3
hset sample/tc1/sensor/setpoint2 3

wait 3600


#heating 3K - 
for {set idx0 0} {$idx0 <7} {incr idx0} {
	broadcast Target temperature = [expr 655-$idx0*50]
	
	drive tc1_temp0_setpoint 300
	drive tc2_temp0_setpoint [expr 655-$idx0*50]
        wait 7200
}





