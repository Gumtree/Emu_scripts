 
histmem stop

# CF-12 VD-1 Lakeshore controller

#hset /instrument/doppler/ctrl/run_cmd 0
#wait 5
#set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
#wait 5

samplename 165-136-137_vapor_23.5mbarloaded_el_cooling295Kto100K

hset /sample/tc2/sensor/setpoint1 100

runscan dummy_motor 10 14 76 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }


#tertiary close
