
histmem stop

# chopper Doppler config example
# set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
# set_chopper_config_with_roi 9.962 40.42 1 1000 16 50 0 255 0 999

# acquisition blocks of 10/3.6 hrs
set n_runl 24
set n_runh 10
set run_time 3600
histmem mode time
histmem preset $run_time

#CF-3 lowT

drive tc1_driveable 288
wait 300
samplename RBC
for {set idx0 0} {$idx0 < $n_runl} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


#drive tc1_driveable 100
#wait 1800
#samplename empty0.2mmANN_100K_lbgdmode
#for {set idx0 0} {$idx0 < $n_runh} {incr idx0} {
#	broadcast data_set $idx0 
#	histmem start block
#	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
#	save 
#}

