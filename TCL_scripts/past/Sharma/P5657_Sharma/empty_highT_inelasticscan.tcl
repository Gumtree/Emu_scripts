# Sample Environment: CF-12 H2 exchange gas
# Sample:p2namn_inelastic

# Doppler = 4.7 m/s
#set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
# low background mode 

# acquisition blocks of 1 hrs

set n_run 1
set run_time 3600
histmem mode time
histmem preset $run_time

samplename empty_inel_300
for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

drive tc2_temp0_setpoint 450
set n_run 4

samplename empty_inel_450
for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

drive tc2_temp0_setpoint 490
set n_run 5

samplename empty_inel_490
for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

#samplename p2namn2_inel_460
#drive tc2_temp0_setpoint 460
#runscan dummy_motor 10 13 4 time 300 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX }

#samplename p2namn2_inel_470
#drive tc2_temp0_setpoint 470
#runscan dummy_motor 10 13 4 time 300 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX }

#samplename p2namn2_inel_480
#drive tc2_temp0_setpoint 480
#runscan dummy_motor 10 13 4 time 300 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX }

#samplename p2namn2_inel_490
#drive tc2_temp0_setpoint 490
#runscan dummy_motor 10 13 6 time 300 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX }

#drive tc2_temp0_setpoint 490
#wait 1800

#set n_run 13
#set run_time 3600
#histmem preset $run_time

#samplename p2namn2_inel_490
#for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	#broadcast data_set $idx0 
	#histmem start block
	#newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	#save 
#}





drive tc2_temp0_setpoint 300

