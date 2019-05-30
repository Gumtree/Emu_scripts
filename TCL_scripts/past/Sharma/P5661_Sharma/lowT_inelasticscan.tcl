# Sample Environment: CF-12 H2 exchange gas
# Sample:nasicon_doped0.128_inelastic

# Doppler = 4.7 m/s
# set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
# low background mode 

# acquisition blocks of 1 hrs

set n_run 10
set run_time 3600
histmem mode time
histmem preset $run_time

#drive tc2_temp0_setpoint 200
#wait 600
#samplename nasicon_doped0.128_inel_200K
#for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
#	broadcast data_set $idx0 
#	histmem start block
#	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
#	save 
#}


#drive tc2_temp0_setpoint 300
#wait 1800
samplename nasicon_doped0.128_inel_300K
for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


set n_run2 12
drive tc2_temp0_setpoint 400
wait 1800
samplename nasicon_doped0.128_inel_400K
for {set idx0 0} {$idx0 < $n_run2} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


drive tc2_temp0_setpoint 295

#hset /sample/.....