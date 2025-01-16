#CF-15, cold-stick
#empty can
#exchange gas, pumping
#no heat shield, top-, bottom Tsensor

histmem stop

hset sample/tc1/heater/heaterRange_1 3 
hset sample/tc1/heater/heaterRange_2 3
hset sample/tc1/heater/heaterRange_3 1

#ramp off
hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0,1.0
hset /sample/tc1/control/ramp_Loop_3 0,1.0
wait 1

#START SEQUENCE 0 - END OF PREVIOUS SET

broadcast Target temperature = 0

#cooling 300 - 3K
hset sample/tc1/sensor/setpoint1 0
hset sample/tc1/sensor/setpoint2 0
hset sample/tc1/sensor/setpoint3 0

#wait 3.5 hours
wait 12600

#Ramp on (sample cartridge+puck, 1K/min, to finish previous set)
hset /sample/tc1/control/ramp_Loop_1 1,1.0
hset /sample/tc1/control/ramp_Loop_2 1,1.0
hset /sample/tc1/control/ramp_Loop_3 0,1.0

broadcast Target temperature = 325
hset sample/tc1/sensor/setpoint1 325
hset sample/tc1/sensor/setpoint2 325
#hset sample/tc1/sensor/setpoint3 325

#wait 5.5 hrs
wait 19800

#END SEQUENCE 0 (9 hrs)

#START SEQUENCE 1 (EFW cooling at 0.5K/min; heating as fast as possible)

#EFW cooling 325 - 3K (HEx + sample cartridge+puck; 0.5K/min)
hset /sample/tc1/control/ramp_Loop_1 0.5,1.0
hset /sample/tc1/control/ramp_Loop_2 0.5,1.0
hset /sample/tc1/control/ramp_Loop_3 0.5,1.0
wait 1

broadcast Target temperature = 0
hset sample/tc1/sensor/setpoint1 0
hset sample/tc1/sensor/setpoint2 0
hset sample/tc1/sensor/setpoint3 0

#Wait 11 hrs
wait 39600

hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0,1.0
hset /sample/tc1/control/ramp_Loop_3 0,1.0
wait 1

#set to 325K using HEx + sample cartridge+ puck
broadcast Target temperature = 325
drive tc1_driveable 325 tc1_driveable2 325 tc1_driveable3 325


#EFW cooling 325 - 3K (HEx and puck only; 0.5K/min)
hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0.5,1.0
hset /sample/tc1/control/ramp_Loop_3 0.5,1.0
wait 1

broadcast Target temperature = 0
hset sample/tc1/sensor/setpoint1 0
hset sample/tc1/sensor/setpoint2 0
hset sample/tc1/sensor/setpoint3 0

#Wait 11 hrs
wait 39600

hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0,1.0
hset /sample/tc1/control/ramp_Loop_3 0,1.0
wait 1

#set to 325K using HEx and puck only
broadcast Target temperature = 325
drive tc1_driveable2 325 tc1_driveable3 325


#EFW cooling 325 - 3K (sample cartridge and puck only; 0.5K/min)
hset /sample/tc1/control/ramp_Loop_1 0.5,1.0
hset /sample/tc1/control/ramp_Loop_2 0.5,1.0
hset /sample/tc1/control/ramp_Loop_3 0,1.0
wait 1

broadcast Target temperature = 0
hset sample/tc1/sensor/setpoint1 0
hset sample/tc1/sensor/setpoint2 0
hset sample/tc1/sensor/setpoint3 0

#Wait 11 hrs
wait 39600

hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0,1.0
hset /sample/tc1/control/ramp_Loop_3 0,1.0
wait 1

#set to 325K using sample cartridge and puck only
broadcast Target temperature = 325
drive tc1_driveable 325 tc1_driveable2 325

#END OF SEQUENCE 1 (52 hrs)

#SEQUENCE 2 (EFW cooling 1.5K/min; heating 1.5K/min) 

#EFW cooling 325 - 3K (HEx + sample cartridge + puck; 1.5K/min)
hset /sample/tc1/control/ramp_Loop_1 1.5,1.0
hset /sample/tc1/control/ramp_Loop_2 1.5,1.0
hset /sample/tc1/control/ramp_Loop_3 1.5,1.0
wait 1

broadcast Target temperature = 0
hset sample/tc1/sensor/setpoint1 0
hset sample/tc1/sensor/setpoint2 0
hset sample/tc1/sensor/setpoint3 0

#Wait 4 hrs
wait 14400

#EFW heating to 325K (HEx + sample cartridge+puck; 1.5K/min)
broadcast Target temperature = 325
hset sample/tc1/sensor/setpoint1 325
hset sample/tc1/sensor/setpoint2 325
hset sample/tc1/sensor/setpoint3 325

#Wait 4 hrs
wait 14400

#EFW  cooling 325 - 3K (HEx and puck only; 1.5K/min)
hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 1.5,1.0
hset /sample/tc1/control/ramp_Loop_3 1.5,1.0
wait 1

broadcast Target temperature = 0
hset sample/tc1/sensor/setpoint1 0
hset sample/tc1/sensor/setpoint2 0
hset sample/tc1/sensor/setpoint3 0

#Wait 4 hrs
wait 14400


#EFW heating to 325K (HEx and puck only; 1.5K/min)
broadcast Target temperature = 325
hset sample/tc1/sensor/setpoint1 0
hset sample/tc1/sensor/setpoint2 325
hset sample/tc1/sensor/setpoint3 325

#Wait 4 hrs
wait 14400

#EFW cooling to 0K (sample cartridge and puck only; 1.5K/min)
hset /sample/tc1/control/ramp_Loop_1 1.5,1.0
hset /sample/tc1/control/ramp_Loop_2 1.5,1.0
hset /sample/tc1/control/ramp_Loop_3 0,1.0
wait 1

broadcast Target temperature = 0
hset sample/tc1/sensor/setpoint1 0
hset sample/tc1/sensor/setpoint2 0
hset sample/tc1/sensor/setpoint3 0

#Wait 4 hrs
wait 14400


#EFW heating to 325K (sample cartridge and puck only; 1.5K/min)
hset /sample/tc1/control/ramp_Loop_1 1.5,1.0
hset /sample/tc1/control/ramp_Loop_2 1.5,1.0
hset /sample/tc1/control/ramp_Loop_3 0,1.0
wait 1

broadcast Target temperature = 325
hset sample/tc1/sensor/setpoint1 325
hset sample/tc1/sensor/setpoint2 325
hset sample/tc1/sensor/setpoint3 0

#Wait 4 hrs
wait 14400

#ramp off
hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0,1.0
hset /sample/tc1/control/ramp_Loop_3 0,1.0
wait 1

#END OF SEQUENCE 2 (24 hrs)
