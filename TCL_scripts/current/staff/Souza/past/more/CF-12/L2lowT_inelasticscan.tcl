histmem stop

# chopper Doppler config example
# set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
# set_chopper_config_with_roi 9.962 40.42 1 1000 16 50 0 255 0 999

# acquisition blocks of 8.2/3 hrs
set n_runl 25
set n_runh 6
set run_time 1800
histmem mode time
histmem preset $run_time

#CF-12 lowT
#drive tc2_temp6_setpoint 1.6
#wait 1800
#samplename m-xylene-1.6K
#for {set idx0 0} {$idx0 < $n_runl} {incr idx0} {
#	broadcast data_set $idx0 
#	histmem start block
#	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
#	save 
#}

#hset /sample/tc1/temp0/setpoint 290
#drive tc2_temp6_setpoint 6
#wait 900
#samplename m-xylene-15K_VTIalso15K
for {set idx0 0} {$idx0 < $n_runh} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

