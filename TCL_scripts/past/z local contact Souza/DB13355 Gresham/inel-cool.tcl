 
histmem stop

hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 2

#hset /sample/tc1/pres7/setpoint 60
#wait 1


samplename 200cStPDMS_dTol_el_coolingtobaseT

runscan dummy_motor 10 14 60 time 30 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

runscan dummy_motor 10 14 180 time 60 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

hset /sample/tc1/pres7/setpoint 6
wait 1

#tertiary close

