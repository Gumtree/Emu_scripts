 
histmem stop

hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 2

#VTI
#hset /sample/tc1/pres7/setpoint 60
#wait 1
#hset /sample/tc3/heater/heaterRange_3 1
#wait 1

#Sample Stick
#hset /sample/tc3/heater/heaterRange_1 3
#wait 1

#VTI
hset /sample/tc1/pres7/setpoint 60
wait 1
hset /sample/tc3/heater/heaterRange_3 1
wait 1
hset /sample/tc3/sensor/setpoint3 1
wait 1

#H2L2
hset /sample/tc3/heater/heaterRange_1 3
wait 1
drive tc3_driveable 50

#VTI
hset /sample/tc1/pres7/setpoint 6
wait 1
drive tc3_driveable3 50

samplename FRZMUN_32pc-50to313K_el

runscan dummy_motor 10 14 10 time 60 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

# ramp for VTI
hset /sample/tc3/control/ramp_loop_3 1,0.5
wait 1
hset /sample/tc3/sensor/setpoint3 313
wait 1
# ramp for H2L2
hset /sample/tc3/control/ramp_loop_1 1,0.5
wait 1
hset /sample/tc3/sensor/setpoint1 313
wait 1

runscan dummy_motor 10 14 536 time 60 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

# Turn ramp off
hset /sample/tc3/control/ramp_loop_3 0,1.0
wait 1
hset /sample/tc3/control/ramp_loop_1 0,1.0
wait 1

# hset /sample/tc3/heater/heaterRange_1 0
wait 1

#tertiary close

