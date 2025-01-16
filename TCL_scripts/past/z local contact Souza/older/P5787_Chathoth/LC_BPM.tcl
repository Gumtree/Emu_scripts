histmem stop

# chopper Doppler config example
# set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
# set_chopper_config_with_roi 9.962 40.42 1 1000 16 50 0 255 0 999

# acquisition blocks
set n_run_a 5
set n_run_b 8
set run_time 3600
histmem mode time
histmem preset $run_time

# June 2017 - 
# CF-11, L1, lowT <-> exchange gas present
# 47 mbar loaded at RT
# needle valve fully open ie 60 mbar

drive tc2_temp6_setpoint 293
wait 300
samplename BPM_293K
for {set idx0 0} {$idx0 < $n_run_a} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


drive tc2_temp6_setpoint 273
wait 600
samplename BPM_273K
for {set idx0 0} {$idx0 < $n_run_a} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

 drive tc2_temp6_setpoint 253
wait 600
samplename BPM_253K
for {set idx0 0} {$idx0 < $n_run_a} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

drive tc2_temp6_setpoint 233
wait 600
samplename BPM_233K
for {set idx0 0} {$idx0 < $n_run_a} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}



drive tc2_temp6_setpoint 213
wait 600
samplename BPM_213K
for {set idx0 0} {$idx0 < $n_run_b} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

drive tc2_temp6_setpoint 293


#drive tc2_temp6_setpoint 333
#wait 600
#samplename sample1_inel_333K
#for {set idx0 0} {$idx0 < $n_run_b} {incr idx0} {
#	broadcast data_set $idx0 
#	histmem start block
#	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
#	save 
#}

