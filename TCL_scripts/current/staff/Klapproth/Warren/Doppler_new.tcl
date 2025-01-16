
#CF-12, L2_puck, cold stick


histmem stop
#hset /sample/tc3/heater/heaterRange_1 3


####################################################################################
####################################################################################

#QENS
#Doppler settings
hset /instrument/doppler/ctrl/profile_selector/settings/profile 0
wait 1
hset /instrument/doppler/ctrl/profile_selector/settings/amplitude 75
wait 1
hset /instrument/doppler/ctrl/profile_selector/settings/velocity 4.7
wait 1
hset /instrument/doppler/ctrl/profile_selector/start 1
wait 45

hset /instrument/doppler/ctrl/run_cmd 1
wait 1

# chopper and Doppler histogram configuration 
set_chopper_config_with_roi 9.962 20.21 1 1000 0 50 0 255 0 999


