
histmem stop

# acquisition blocks of x/3600 hrs
set n_run 7
set run_time 3600
histmem mode time
histmem preset $run_time
wait 600

samplename HDKH30_200cSt_300K_inel 

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

# Cool to 50
# SP for VTI
hset /sample/tc1/pres7/setpoint 60
wait 1
hset /sample/tc3/sensor/setpoint3 95
wait 1
# SP for H2L2
hset /sample/tc3/heater/heaterRange_1 0
wait 1
drive tc3_driveable3 95
hset /sample/tc1/pres7/setpoint 6