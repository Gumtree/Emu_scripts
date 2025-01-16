 
histmem stop

samplename vanadium_EFW

#Ramp on for sample stick from Lakeshore
#hset /sample/tc1/pres3/setpoint 6
hset /sample/tc3/control/ramp_loop_1 1,1.0
hset /sample/tc3/control/ramp_loop_3 1,1.0
wait 1
hset /sample/tc3/sensor/setpoint1 298
hset /sample/tc3/sensor/setpoint3 298
wait 1


runscan dummy_motor 10 14 6 time 600 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }


#Ramp off for sample stick from Lakeshore

hset /sample/tc3/control/ramp_loop_1 1,1.0
hset /sample/tc3/control/ramp_loop_3 1,1.0
wait 1