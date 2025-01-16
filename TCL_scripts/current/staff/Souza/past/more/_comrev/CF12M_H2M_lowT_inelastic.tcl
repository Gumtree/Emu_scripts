histmem stop

# chopper Doppler config example
 set_chopper_config_with_roi 9.962 20.21 1 1000 0 50 0 255 0 999
# set_chopper_config_with_roi 9.962 40.42 1 1000 0 50 0 255 0 999
wait 3

hset /instrument/doppler/ctrl/run_cmd 1
wait 3

# acquisition blocks of x/3600 hrs
set n_run 24
set run_time 3600
histmem mode time
histmem preset $run_time

# cooling
samplename emptyCF12+L2-inel
#hset /sample/tc1/pres3/setpoint 60
#hset /sample/tc1/temp0/setpoint 299.5
#drive tc2_temp0_setpoint 300
#hset /sample/tc1/pres3/setpoint 10
#wait 1800
for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


# cooling
#samplename methanol_60K
#hset /sample/tc1/pres3/setpoint 60
#hset /sample/tc1/temp0/setpoint 59
#drive tc2_temp0_setpoint 60
#hset /sample/tc1/pres3/setpoint 10
#wait 900
#"acquisitionloop"

# heating
#samplename methanol_100K
#hset /sample/tc2/temp0/setpoint 100
#drive tc1_temp0_setpoint 99
#wait 900
#"acquisitionloop"

