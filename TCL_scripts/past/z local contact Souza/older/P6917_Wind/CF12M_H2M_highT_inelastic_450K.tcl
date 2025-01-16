histmem stop

# chopper Doppler config example
# set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
# set_chopper_config_with_roi 9.962 40.42 1 1000 16 50 0 255 0 999

# acquisition blocks of x/3600 hrs
set n_runl 70
set run_time 3600
histmem mode time
histmem preset $run_time

samplename c-Na3PS4_400K

# tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
# tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:0.5

drive tc2_temp0_setpoint 400

# tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF
wait 1200

for {set idx0 0} {$idx0 < $n_runl} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


