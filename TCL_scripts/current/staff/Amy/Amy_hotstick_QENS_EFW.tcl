#CF-15, cold-stick
#empty can
#exchange gas, pumping
#no heat shield, top-, bottom Tsensor

histmem stop

#ramp off
hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0,1.0
hset /sample/tc1/control/ramp_Loop_3 0,1.0
hset /sample/tc1/control/ramp_Loop_4 0,1.0
wait 1

#START SEQUENCE 1 - controlling sample with ring, plus hot puck

#sample heater (cartridge or ring)
hset sample/tc1/heater/heaterRange_1 3 
#Cold puck
hset sample/tc1/heater/heaterRange_2 0
#Hot puck
hset sample/tc1/heater/heaterRange_3 1
#HEx heater
hset sample/tc1/heater/heaterRange_4 0

#set sample to 300K
broadcast Target temperature = 300
drive tc1_driveable 300
wait 1

#heating puck 300K - 500K

for {set idx0 0} {$idx0 <5} {incr idx0} {
	broadcast Target temperature = [expr $idx0*50+300]
	
	drive tc1_driveable3 [expr $idx0*50+300]
	wait 3600
}

#heating puck 350K - 450K

#for {set idx0 0} {$idx0 <4} {incr idx0} {
#	broadcast Target temperature = [expr $idx0*25+350]
#	
#	drive tc1_driveable3 [expr $idx0*25+350] 
#	wait 3600
#}

#heating puck 450K - 700K

#for {set idx0 0} {$idx0 <6} {incr idx0} {
#	broadcast Target temperature = [expr $idx0*50+450]
#	
#	drive tc1_driveable3 [expr $idx0*50+450] 
#	wait 3600
#}

#cool to 300K as fast as possible
	broadcast Target temperature = 300
	
	drive tc1_driveable [300] tc1_driveable3 [300] 
	wait 3600

#heat puck to 500K as fast as possible
broadcast Target temperature = 500

drive tc1_driveable3 [500] 
wait 3600

#ramp on (2K/min)
hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0,1.0
hset /sample/tc1/control/ramp_Loop_3 2,1.0
hset /sample/tc1/control/ramp_Loop_4 0,1.0
wait 1

#Cool to 300K at 2K/min
broadcast Target temperature = 300
hset sample/tc1/sensor/setpoint3 300

#wait 5.5 hrs
wait 19800

#Just to make sure it has arrived:
drive tc1_driveable [300] tc1_driveable3 [300] 

#ramp off
hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0,1.0
hset /sample/tc1/control/ramp_Loop_3 0,1.0
hset /sample/tc1/control/ramp_Loop_4 0,1.0
wait 1


#END SEQUENCE 1 - estimated 17 hrs


#START SEQUENCE 2 - controlling HEx with HEx, plus hot puck

#sample heater (cartridge or ring)
hset sample/tc1/heater/heaterRange_1 0 
#Cold puck
hset sample/tc1/heater/heaterRange_2 0
#Hot puck
hset sample/tc1/heater/heaterRange_3 1
#HEx heater
hset sample/tc1/heater/heaterRange_4 1

#set HEx to 300K

drive tc1_driveable4 [300]
wait 1

#heating puck 300K - 500K

for {set idx0 0} {$idx0 <5} {incr idx0} {
	broadcast Target temperature = [expr $idx0*50+300]
	
	drive tc1_driveable3 [expr $idx0*50+300]
	wait 3600
}

#heating puck 300K - 345K

#for {set idx0 0} {$idx0 <10} {incr idx0} {
#	broadcast Target temperature = [expr $idx0*5+300]
#	
#	drive tc1_driveable3 [expr $idx0*5+300]
#	wait 3600
#}

#heating puck 350K - 450K

#for {set idx0 0} {$idx0 <4} {incr idx0} {
#	broadcast Target temperature = [expr $idx0*25+350]
#	
#	drive tc1_driveable3 [expr $idx0*25+350] 
#	wait 3600
#}

#heating puck 450K - 700K

#for {set idx0 0} {$idx0 <6} {incr idx0} {
#	broadcast Target temperature = [expr $idx0*50+450]
#	
#	drive tc1_driveable3 [expr $idx0*50+450] 
#	wait 3600
#}

#cool to 300K as fast as possible
	broadcast Target temperature = 300
	
	drive tc1_driveable3 [300] tc1_driveable4 [300] 
	wait 3600

#heat puck to 500K as fast as possible
broadcast Target temperature = 500

drive tc1_driveable3 [500] 
wait 3600

#ramp on (2K/min)
hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0,1.0
hset /sample/tc1/control/ramp_Loop_3 2,1.0
hset /sample/tc1/control/ramp_Loop_4 0,1.0
wait 1

#Cool to 300K at 2K/min
broadcast Target temperature = 300
hset sample/tc1/sensor/setpoint3 300

#wait 5.5 hrs
wait 19800

#Just to make sure it has arrived:
drive tc1_driveable3 [300] tc1_driveable4 [300] 

#ramp off
hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0,1.0
hset /sample/tc1/control/ramp_Loop_3 0,1.0
hset /sample/tc1/control/ramp_Loop_4 0,1.0
wait 1


#END SEQUENCE 2 - estimated 17 hrs


#START SEQUENCE 3 - controlling sample with ring, HEx with HEx, plus hot puck

#sample heater (cartridge or ring)
hset sample/tc1/heater/heaterRange_1 1 
#Cold puck
hset sample/tc1/heater/heaterRange_2 0
#Hot puck
hset sample/tc1/heater/heaterRange_3 1
#HEx heater
hset sample/tc1/heater/heaterRange_4 1

#set HEx and sample to 300K

drive tc1_driveable [300] tc1_driveable4 [300]
wait 1

#heating puck 300K - 500K

for {set idx0 0} {$idx0 <5} {incr idx0} {
	broadcast Target temperature = [expr $idx0*50+300]
	
	drive tc1_driveable3 [expr $idx0*50+300]
	wait 3600
}

#heating puck 300K - 345K

#for {set idx0 0} {$idx0 <10} {incr idx0} {
#	broadcast Target temperature = [expr $idx0*5+300]
#	
#	drive tc1_driveable3 [expr $idx0*5+300]
#	wait 3600
#}

#heating puck 350K - 450K

#for {set idx0 0} {$idx0 <4} {incr idx0} {
#	broadcast Target temperature = [expr $idx0*25+350]
#	
#	drive tc1_driveable3 [expr $idx0*25+350] 
#	wait 3600
#}

#heating puck 450K - 700K

#for {set idx0 0} {$idx0 <6} {incr idx0} {
#	broadcast Target temperature = [expr $idx0*50+450]
#	
#	drive tc1_driveable3 [expr $idx0*50+450] 
#	wait 3600
#}

#cool to 300K as fast as possible
	broadcast Target temperature = 300
	
	drive tc1_driveable [300] tc1_driveable3 [300] tc1_driveable4 [300] 
	wait 3600

#heat puck to 700K as fast as possible
broadcast Target temperature = 500

drive tc1_driveable3 [500] 
wait 3600

#ramp on (2K/min)
hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0,1.0
hset /sample/tc1/control/ramp_Loop_3 2,1.0
hset /sample/tc1/control/ramp_Loop_4 0,1.0
wait 1

#Cool to 300K at 2K/min
broadcast Target temperature = 300
hset sample/tc1/sensor/setpoint3 300

#wait 5.5 hrs
wait 19800

#Just to make sure it has arrived:
drive tc1_driveable [300] tc1_driveable3 [300] tc1_driveable4 [300] 

#ramp off
hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0,1.0
hset /sample/tc1/control/ramp_Loop_3 0,1.0
hset /sample/tc1/control/ramp_Loop_4 0,1.0
wait 1


#END SEQUENCE 3 - estimated 17 hrs



