 
histmem stop

# CF-12 H2 Mercury controller

#hset /instrument/doppler/ctrl/run_cmd 0
#wait 5
#set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
#wait 5

samplename 1%dBC_20IL%dDMF_el_300Kto50K

hset /sample/tc1/temp0/setpoint 49.5
hset /sample/tc2/temp0/setpoint 50

runscan dummy_motor 10 14 130 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }


#tertiary close
