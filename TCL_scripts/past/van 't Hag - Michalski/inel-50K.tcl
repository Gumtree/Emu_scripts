
histmem stop

# Doppler settings
#hset /instrument/doppler/ctrl/run_cmd 1
#wait 1
# chopper and Doppler histogram configuration 
#set_chopper_config_with_roi 9.962 20.21 1 1000 0 50 0 255 0 999


# acquisition blocks of x/3600 hrs
set n_run 2
set run_time 2400
histmem mode time
histmem preset $run_time

# VTI undercooling
hset /sample/tc1/pres7/setpoint 60
wait 1
hset /sample/tc3/sensor/setpoint3 5
wait 1
# sample 
hset /sample/tc3/heater/heaterRange_1 3
wait 1
drive tc3_driveable 50
# VTI
hset /sample/tc1/pres7/setpoint 2
wait 1
drive tc3_driveable3 50

#wait 900

samplename 60ODKP0pc-50K_inel

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

