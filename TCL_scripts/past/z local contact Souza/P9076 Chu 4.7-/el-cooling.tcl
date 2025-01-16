 
histmem stop


#hset /instrument/doppler/ctrl/run_cmd 0
#wait 1
#set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
#wait 2

#hset /sample/tc1/pres3/setpoint 60
#wait 1
#hset /sample/tc1/temp0/setpoint 300
#wait 1
#drive tc3_driveable2 300
#hset /sample/tc1/pres3/setpoint 8
#wait 300


samplename Re-hist-coolingtobaseT_el

runscan dummy_motor 10 14 900 time 60 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }


#tertiary close
