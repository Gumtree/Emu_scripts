 
histmem stop

hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 2

#hset /sample/tc1/pres7/setpoint 60
#wait 1

# ramp for VTI
#hset /sample/tc3/heater/heaterRange_3 1
#wait 1
#hset /sample/tc3/control/ramp_loop_3 1,0.25
#wait 1
#hset /sample/tc3/sensor/setpoint3 240
#wait 1
# ramp for H2L2
#hset /sample/tc3/heater/heaterRange_1 3
#wait 1
#hset /sample/tc3/control/ramp_loop_1 1,0.25
#wait 1
#hset /sample/tc3/sensor/setpoint1 240
#wait 1

samplename NVPeutect_elas_cool

runscan dummy_motor 10 14 60 time 30 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

runscan dummy_motor 10 14 600 time 60 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

hset /sample/tc3/control/ramp_loop_3 0,1.0
wait 1
hset /sample/tc3/control/ramp_loop_1 0,1.0
wait 1

hset /sample/tc1/pres7/setpoint 6
wait 1

#tertiary close

