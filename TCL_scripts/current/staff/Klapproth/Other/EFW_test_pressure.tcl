 
histmem stop



#ramp needle valve
tc1_queue send SET:DEV:DB4.G1:PRES:LOOP:RENA:ON
tc1_queue send SET:DEV:DB4.G1:PRES:LOOP:RSET:2
hset /sample/tc1/pres3/setpoint 6



