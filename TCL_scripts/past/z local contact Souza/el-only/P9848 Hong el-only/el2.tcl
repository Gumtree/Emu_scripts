 
histmem stop

#hset /instrument/doppler/ctrl/run_cmd 0
#wait 1
#set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
#wait 2


#wait 1800

samplename P(VDF-TrFE-CFE)+0.01DMHD-unannealed-el

# ramp for VTI
#hset /sample/tc3/heater/heaterRange_3 1
#wait 1
hset /sample/tc3/control/ramp_loop_3 1,0.5
wait 1
hset /sample/tc3/sensor/setpoint3 310
wait 1
# ramp for H2
#hset /sample/tc3/heater/heaterRange_1 3
#wait 1
hset /sample/tc3/control/ramp_loop_1 1,0.5
wait 1
hset /sample/tc3/sensor/setpoint1 350
wait 1

#hset /sample/tc1/pres7/setpoint 6
#wait 1

runscan dummy_motor 10 14 390 time 60 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

hset /sample/tc3/control/ramp_loop_3 0,1.0
wait 1
hset /sample/tc3/control/ramp_loop_1 0,1.0
wait 1

#tertiary close

