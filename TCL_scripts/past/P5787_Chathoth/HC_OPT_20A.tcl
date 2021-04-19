histmem stop

# chopper Doppler config example
# set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
# set_chopper_config_with_roi 9.962 40.42 1 1000 16 50 0 255 0 999

# acquisition blocks
set n_run_a 24
set n_run_b 8
set run_time 3600
histmem mode time
histmem preset $run_time

# June 2017 - 
# CF-11, H1, lowT <-> exchange gas present
# 47 mbar loaded at RT
# needle valve fully open ie 60 mbar



drive tc3_driveable 323
wait 300
samplename OTP_20A_323K
for {set idx0 0} {$idx0 < $n_run_a} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}



drive tc3_driveable 100
#wait 600
samplename OTP_20A_100K
for {set idx0 0} {$idx0 < $n_run_a} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}



#drive tc3_driveable 333
#wait 600
#samplename sample1_inel_333K
#for {set idx0 0} {$idx0 < $n_run_b} {incr idx0} {
#	broadcast data_set $idx0 
#	histmem start block
#	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
#	save 
#}

