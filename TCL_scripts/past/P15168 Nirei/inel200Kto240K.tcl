
histmem stop

# Doppler settings
#hset /instrument/doppler/ctrl/run_cmd 0
#wait 1
hset /instrument/doppler/ctrl/amplitude 40
wait 1
hset /instrument/doppler/ctrl/velocity 3.1
wait 1
hset /instrument/doppler/ctrl/run_cmd 1
wait 1

# chopper and Doppler histogram configuration 
# (1:1 mode only) set_chopper_config_with_roi 9.962 40.42 1 1000 0 50 0 255 0 999
set_chopper_config_with_roi 12.333 20.21 1 1000 0 50 0 255 0 999
wait 2

#------------200 K-----------------------

#VTI temp control 
hset /sample/tc3/sensor/setpoint1 190
wait 1
#H1 centrestick temp control
hset /sample/tc2/sensor/setpoint1 200
wait 1
hset /sample/tc2/heater/heaterRange_1 3
wait 1

# acquisition blocks of x/3600 hrs
set n_run 7
set run_time 1800
histmem mode time
histmem preset $run_time

#wait 900

samplename PT8-12_200K_inel

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

#------------220 K-----------------------

#VTI temp control 
hset /sample/tc3/sensor/setpoint1 200
wait 1
#H1 centrestick temp control
hset /sample/tc2/sensor/setpoint1 220
wait 1
hset /sample/tc2/heater/heaterRange_1 3
wait 1

# acquisition blocks of x/3600 hrs
set n_run 13
set run_time 1800
histmem mode time
histmem preset $run_time

wait 1800

samplename PT8-12_220K_inel

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

#------------240 K-----------------------

#VTI temp control 
hset /sample/tc3/sensor/setpoint1 220
wait 1
#H1 centrestick temp control
hset /sample/tc2/sensor/setpoint1 240
wait 1
hset /sample/tc2/heater/heaterRange_1 3
wait 1

# acquisition blocks of x/3600 hrs
set n_run 20
set run_time 1800
histmem mode time
histmem preset $run_time

wait 1800

samplename PT8-12_240K_inel

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}