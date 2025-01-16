#CF-15


histmem stop
wait 1

#Doppler settings
hset /instrument/doppler/ctrl/profile_selector/settings/profile 0
wait 1
hset /instrument/doppler/ctrl/profile_selector/settings/amplitude 75
wait 1
hset /instrument/doppler/ctrl/profile_selector/settings/velocity 4.7
wait 1
hset /instrument/doppler/ctrl/profile_selector/settings/offset 0
wait 1
drive doppler_start 1

#QENS
#Doppler
#hset /instrument/doppler/ctrl/run_cmd 1
wait 1
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 1


################################################################################
###################################################################################
wait 14400

#####################################################################################################
###############################################################################
#Doppler settings
hset /instrument/doppler/ctrl/profile_selector/settings/profile 1
wait 1
hset /instrument/doppler/ctrl/profile_selector/settings/amplitude 75
wait 1
hset /instrument/doppler/ctrl/profile_selector/settings/velocity 2.27
wait 1
hset /instrument/doppler/ctrl/profile_selector/settings/offset 0
wait 1
drive doppler_start 1

#QENS
#Doppler
#hset /instrument/doppler/ctrl/run_cmd 1
wait 1
set_chopper_config_with_roi 9.692 20.21 1 1000 16 50 0 255 0 999
wait 1