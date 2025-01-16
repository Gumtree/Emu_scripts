
histmem stop


# acquisition blocks of x/3600 hrs
set n_run 2
set run_time 3600
histmem mode time
histmem preset $run_time

# VTI
hset /sample/tc3/sensor/setpoint3 315
wait 1
# H2
hset /sample/tc3/heater/heaterRange_1 3
wait 1
drive tc3_driveable 348
wait 900

samplename KTY_4_EtOH_348K_inel

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

# Cool to 50
# SP for VTI
# hset /sample/tc3/heater/heaterRange_3 0
# wait 1
# SP for H2L2
#hset /sample/tc3/heater/heaterRange_1 0
#wait 1

