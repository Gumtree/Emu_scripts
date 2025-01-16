 
histmem stop

wait 1800

# CF-12 H1 Lakeshore controller

samplename Hyd_Oli_el_300to750K

hset /instrument/doppler/ctrl/run_cmd 0
wait 15

set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

hset /sample/tc1/pres3/setpoint 15
hset /sample/tc2/control/ramp_loop_1 1,+00.5
hset /sample/tc2/sensor/setpoint1 750
runscan dummy_motor 10 14 185 time 300 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

#hset /sample/tc2/control/ramp_loop_1 0,+00.5



