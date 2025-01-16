 
histmem stop

#Doppler drive control
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 2


samplename PT2-6_cryst-280Kto15K_el

# VTI needle valve
hset /sample/tc1/pres3/setpoint 60
wait 1
#VTI temp control 
hset /sample/tc3/sensor/setpoint1 15
wait 1
#H1 centrestick temp control
hset /sample/tc2/sensor/setpoint1 15
wait 1
hset /sample/tc2/heater/heaterRange_1 3
wait 1

# ramp for VTI
# ramp for lakeshore
#hset /sample/tc3/control/ramp_loop_1 1,1.0
#wait 1
#hset /sample/tc3/sensor/setpoint1 407
#wait 1

runscan dummy_motor 10 14 400 time 60 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

# VTI needle valve
hset /sample/tc1/pres3/setpoint 6
wait 1


#hset /sample/tc3/control/ramp_loop_1 0,1.0

#tertiary close



