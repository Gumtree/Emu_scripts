
histmem stop

# Doppler settings
#hset /instrument/doppler/ctrl/profile_selector/settings/profile 0
#wait 1
#hset /instrument/doppler/ctrl/profile_selector/settings/amplitude 75
#wait 1
#hset /instrument/doppler/ctrl/profile_selector/settings/velocity 4.7
#wait 1
#hset /instrument/doppler/ctrl/profile_selector/settings/offset 0
#wait 1
#drive doppler_start 1
# chopper and Doppler histogram configuration 
# (1:1 mode only) set_chopper_config_with_roi 9.962 40.42 1 1000 0 50 0 255 0 999
#set_chopper_config_with_roi 9.962 20.21 1 1000 0 50 0 255 0 999
#wait 2

# acquisition blocks of x/3600 hrs
set n_run 48
set run_time 3600
histmem mode time
histmem preset $run_time

# VTI
hset /sample/tc1/pres7/setpoint 60
wait 1
hset /sample/tc3/sensor/setpoint3 50
wait 1
# sample 
drive tc3_driveable 130
# VTI
hset /sample/tc1/pres7/setpoint 10
wait 1
drive tc3_driveable3 130

#For 200 K
#drive tc3_driveable 200 tc3_driveable3 200 
#wait 900 

samplename Mono1-130K_He_inel_fullrange

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

newfile clear
histmem stop

