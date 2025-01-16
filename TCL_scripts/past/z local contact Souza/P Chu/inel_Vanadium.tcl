histmem stop

# CF-12 L2 Mercury controller

#Controlling Doppler
hset /instrument/doppler/ctrl/run_cmd 1
wait 3
set_chopper_config_with_roi 9.962 20.21 1 1000 0 50 0 255 0 999
wait 3


samplename inelastic_Vanadium

# ramping below to avoid undershoot
#Ramp for cryo
#tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
#tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:0.5
#hset /sample/tc1/temp0/setpoint 266
#Ramp for samplestick
#tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RENA:ON
#tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RSET:0.5
#drive tc2_temp6_setpoint 266
#switch ramps off
#tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF
#tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RENA:OFF

#wait 600 

# acquisition blocks of x/3600 hrs
set n_run 6
set run_time 3600
histmem mode time
histmem preset $run_time 

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}



