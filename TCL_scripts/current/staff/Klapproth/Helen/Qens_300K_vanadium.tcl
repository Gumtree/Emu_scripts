
#CF-12, H2_puck, hot stick


histmem stop
hset /sample/tc3/heater/heaterRange_1 3


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


#temperature
hset /sample/tc1/pres7/setpoint 6
drive tc3_driveable3 300 tc3_driveable 300
#wait 300

# Acquisition

histmem mode time
histmem preset 1800

samplename Vanadium_flat_300K

for {set idx0 0} {$idx0 < 32} {incr idx0} {
	broadcast loop $idx0 Vanadium_flat_300K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

###################################################################################

