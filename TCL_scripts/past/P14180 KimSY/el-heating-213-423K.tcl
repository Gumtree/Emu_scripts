 
histmem stop

hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 2

#wait 3600

samplename KTY_1_heptane_el_heating213to423K

# VTI
hset /sample/tc3/sensor/setpoint3 150
wait 1
# H2
hset /sample/tc3/heater/heaterRange_1 3
wait 1
drive tc3_driveable 213
# VTI
hset /sample/tc3/heater/heaterRange_3 1
wait 1
hset /sample/tc3/sensor/setpoint3 213
wait 1
wait 600

# ramp for VTI

hset /sample/tc3/control/ramp_loop_3 1,1.0
wait 1
hset /sample/tc3/sensor/setpoint3 315
wait 1
# ramp for H2L2
hset /sample/tc3/control/ramp_loop_1 1,1.0
wait 1
hset /sample/tc3/sensor/setpoint1 423
wait 1

runscan dummy_motor 10 14 225 time 60 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

# Turn ramp off
hset /sample/tc3/control/ramp_loop_3 0,1.0
wait 1
hset /sample/tc3/control/ramp_loop_1 0,1.0
wait 1

#tertiary close

