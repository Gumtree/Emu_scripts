 
histmem stop


hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 2

hset /sample/tc3/heater/heaterRange_2 3
wait 1
hset /sample/tc3/heater/heaterRange_1 3
wait 1

#drive tc3_driveable 20
#hset /sample/tc1/pres7/setpoint 6
#wait 1


samplename Vplate_el

runscan dummy_motor 10 14 6 time 1800 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }


#tertiary close
