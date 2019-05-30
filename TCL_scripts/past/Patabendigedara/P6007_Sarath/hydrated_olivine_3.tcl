 
histmem stop

# CF-12 H1 Lakeshore controller

samplename Hyd_Oli_inel_300K
hset /instrument/doppler/ctrl/run_cmd 1
wait 15
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
hset /sample/tc2/control/ramp_loop_1 0,+005.0
drive tc2_driveable 300
wait 900
#12hrs
set n_run 24
set run_time 1800
histmem mode time
histmem preset $run_time
for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}



