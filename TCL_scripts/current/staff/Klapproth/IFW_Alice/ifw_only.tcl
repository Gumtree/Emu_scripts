 
histmem stop

#Doppler drive control
hset /instrument/doppler/ctrl/profile_selector/settings/profile 1
wait 1
hset /instrument/doppler/ctrl/profile_selector/settings/amplitude 75
wait 1
hset /instrument/doppler/ctrl/profile_selector/settings/velocity 0.7
wait 1
drive doppler_start 1

#hset /instrument/doppler/ctrl/profile_selector/start 1
#wait 45
#hset /instrument/doppler/ctrl/run_cmd 1
#wait 1
#run dopppler_start 1 is equivalent to hset but with more verbose to sics and gumtree
#drive doppler_start 1 is available


set_chopper_config_with_roi 2.265 20.21 1 1000 0 50 0 255 0 999

samplename glycerol_He_0.7FW

runscan dummy_motor 10 14 4 time 900 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }


#Doppler drive control
hset /instrument/doppler/ctrl/profile_selector/settings/profile 1
wait 1
hset /instrument/doppler/ctrl/profile_selector/settings/amplitude 75
wait 1
hset /instrument/doppler/ctrl/profile_selector/settings/velocity 1.0
wait 1
drive doppler_start 1



set_chopper_config_with_roi 3.186 20.21 1 1000 0 50 0 255 0 999

samplename glycerol_He_1.0FW

runscan dummy_motor 10 14 4 time 900 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }



#Doppler drive control
hset /instrument/doppler/ctrl/profile_selector/settings/profile 1
wait 1
hset /instrument/doppler/ctrl/profile_selector/settings/amplitude 75
wait 1
hset /instrument/doppler/ctrl/profile_selector/settings/velocity 1.5
wait 1
drive doppler_start 1




set_chopper_config_with_roi 4.654 20.21 1 1000 0 50 0 255 0 999

samplename glycerol_He_1.5FW

runscan dummy_motor 10 14 4 time 900 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }




hset /instrument/doppler/ctrl/profile_selector/settings/profile 1
wait 1
hset /instrument/doppler/ctrl/profile_selector/settings/amplitude 75
wait 1
hset /instrument/doppler/ctrl/profile_selector/settings/velocity 2.5
wait 1
hset /instrument/doppler/ctrl/profile_selector/start 1
wait 45
#hset /instrument/doppler/ctrl/run_cmd 1
#wait 1
set_chopper_config_with_roi 7.223 20.21 1 1000 0 50 0 255 0 999

samplename glycerol_He_2.5FW

runscan dummy_motor 10 14 4 time 900 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }




hset /instrument/doppler/ctrl/profile_selector/settings/profile 1
wait 1
hset /instrument/doppler/ctrl/profile_selector/settings/amplitude 75
wait 1
hset /instrument/doppler/ctrl/profile_selector/settings/velocity 3.5
wait 1
hset /instrument/doppler/ctrl/profile_selector/start 1
wait 45
#hset /instrument/doppler/ctrl/run_cmd 1
#wait 1
set_chopper_config_with_roi 9.077 20.21 1 1000 0 50 0 255 0 999

samplename glycerol_He_3.5FW

runscan dummy_motor 10 14 4 time 900 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }





hset /instrument/doppler/ctrl/profile_selector/settings/profile 0
wait 1
hset /instrument/doppler/ctrl/profile_selector/settings/amplitude 75
wait 1
hset /instrument/doppler/ctrl/profile_selector/settings/velocity 4.7
wait 1
hset /instrument/doppler/ctrl/profile_selector/start 1
wait 45
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999

samplename glycerol_He_0

runscan dummy_motor 10 14 4 time 900 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

#tertiary close



