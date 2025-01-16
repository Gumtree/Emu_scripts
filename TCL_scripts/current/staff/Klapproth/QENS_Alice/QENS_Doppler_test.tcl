#CF-15


histmem stop


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

#Temperature
#drive tc1_driveable 300 tc1_driveable2 300
#wait 300

# Acquisition 
histmem mode time
histmem preset 3600


samplename empty cryo_RT 
for {set idx0 0} {$idx0 < 30} {incr idx0} {
	broadcast loop $idx0 empty cryo_RT  
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
################################################################################
###################################################################################

