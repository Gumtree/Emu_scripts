#CF-15


histmem stop
#ramp off
hset /sample/tc1/control/ramp_Loop_1 0,1.0
hset /sample/tc1/control/ramp_Loop_2 0,1.0
hset /sample/tc1/control/ramp_Loop_3 0,1.0
hset /sample/tc1/control/ramp_Loop_4 0,1.0
wait 1

#sample heater (cartridge or ring)
hset sample/tc1/heater/heaterRange_1 3 
#Cold puck
hset sample/tc1/heater/heaterRange_2 3
#Hot puck
hset sample/tc1/heater/heaterRange_3 0
#HEx heater
hset sample/tc1/heater/heaterRange_4 0
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

#Temperature
drive tc1_driveable 138 tc1_driveable2 138
wait 300

# Acquisition 
histmem mode time
histmem preset 3600


samplename 7p5_H2O_h-Phyt_138K
for {set idx0 0} {$idx0 < 10} {incr idx0} {
	broadcast loop $idx0 7p5_H2O_h-Phyt_138K  
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
################################################################################
###################################################################################

