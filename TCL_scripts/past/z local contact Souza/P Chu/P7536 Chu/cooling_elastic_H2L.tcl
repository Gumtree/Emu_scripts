 
histmem stop

# CF-12 H2 Lakeshore controller

hset /instrument/doppler/ctrl/run_cmd 0
wait 5
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 5

samplename xy_8_D2O_el_300to10K

hset /sample/tc2/control/ramp_loop_1 1,1
hset /sample/tc2/sensor/setpoint1 10

runscan dummy_motor 10 14 295 time 60 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }


hset /sample/tc2/control/ramp_loop_1 0,1

#tertiary close
