
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
set n_run 12
set run_time 3600
histmem mode time
histmem preset $run_time

samplename TrzH2PO4-393K_inel

# ramp sample temperature
hset /sample/tc1/control/ramp_loop_3 1,1.0
wait 1
hset /sample/tc1/sensor/setpoint3 383
wait 1

wait 1200

hset /sample/tc1/control/ramp_loop_3 1,0.5
wait 1
hset /sample/tc1/sensor/setpoint3 393
wait 1

wait 1800

hset /sample/tc1/control/ramp_loop_1 0,1.0
wait 1
hset /sample/tc1/control/ramp_loop_3 0,1.0
wait 1

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

hset /sample/tc1/sensor/setpoint1 200
wait 1
hset /sample/tc1/sensor/setpoint3 333
wait 1

