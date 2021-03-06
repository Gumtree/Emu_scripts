histmem stop 


# chopper Doppler config example
# set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
# set_chopper_config_with_roi 9.962 40.42 1 1000 16 50 0 255 0 999

# acquisition blocks of n_runx hrs
set n_runl 4
set n_runh 20
set run_time 3600
histmem mode time
histmem preset $run_time

#CF-12 lowT
drive tc2_temp6_setpoint 100
#wait 600
samplename grapheneOxide_100K
for {set idx0 0} {$idx0 < $n_runl} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


drive tc2_temp6_setpoint 260
wait 1500
samplename grapheneOxide_260K
for {set idx0 0} {$idx0 < $n_runh} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
