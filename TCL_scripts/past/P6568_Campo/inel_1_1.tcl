 
histmem stop

#set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
# CF-12 H2 Mercury controller

samplename Co-citrate-g_1.6K

drive tc2_temp0_setpoint 10
hset /sample/tc1/pres3/setpoint 6
hset /sample/tc2/temp0/setpoint 1
wait 1800

set n_run 7
set run_time 3600
histmem mode time
histmem preset $run_time

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

