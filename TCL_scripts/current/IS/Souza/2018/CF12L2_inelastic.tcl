histmem stop

# chopper Doppler config example
# set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
# set_chopper_config_with_roi 9.962 40.42 1 1000 16 50 0 255 0 999

# acquisition blocks of x/3600 hrs
set n_runl 70
set n_runh 10
set run_time 3600
histmem mode time
histmem preset $run_time

# CF-12 VTI and L2-H2 Mercury controllers
#hset /sample/tc1/temp0/setpoint 259
#drive tc1_temp0_setpoint 300
#drive tc2_temp6_setpoint 310
#wait 300
#samplename GrOx+NH4Cl-100%H2O_inel_260K

for {set idx0 0} {$idx0 < $n_runl} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


#hset /sample/tc1/temp0/setpoint 290
#hset /sample/tc1/pres3/setpoint 20
#drive tc2_temp0_setpoint 295
#wait 900
#samplename V_295K
#for {set idx0 0} {$idx0 < $n_runh} {incr idx0} {
#	broadcast data_set $idx0 
#	histmem start block
#	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
#	save 
#}
