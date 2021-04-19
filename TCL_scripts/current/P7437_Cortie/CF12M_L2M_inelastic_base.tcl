histmem stop

#hset /instrument/doppler/ctrl/run_cmd 1
#wait 5

# chopper Doppler config example
# set_chopper_config_with_roi 9.962 20.21 1 1000 0 50 0 255 0 999
# wait 5

# acquisition blocks of x/3600 hrs
set n_run 12
set run_time 3600
histmem mode time
histmem preset $run_time

# cooling
samplename USN_Al40nm_dry_baseT
#hset /sample/tc1/temp0/setpoint 19
#drive tc2_temp6_setpoint 240
#hset /sample/tc1/pres3/setpoint 10
#wait 600
for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

# cooling
#samplename V_1.7K
#set n_run 12
#hset /sample/tc1/pres3/setpoint 60
#hset /sample/tc1/temp0/setpoint 1
#drive tc2_temp6_setpoint 8
#hset /sample/tc1/pres3/setpoint 6
#wait 1200
#wait 1800
#for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
#	broadcast data_set $idx0 
#	histmem start block
#	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
#	save 
#}


# heating
#samplename tol_inel_35K
#hset /sample/tc2/temp6/setpoint 35
#drive tc1_temp0_setpoint 34
#wait 300
#for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
#	broadcast data_set $idx0 
#	histmem start block
#	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
#	save 
#}


# heating
#samplename tol_inel_45K
#set n_run 12
#hset /sample/tc2/temp6/setpoint 45
#drive tc1_temp0_setpoint 44
#wait 300
#for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
#	broadcast data_set $idx0 
#	histmem start block
#	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
#	save 
#}
