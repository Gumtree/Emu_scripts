histmem stop

# CF-12 H2 Mercury controller

#Controling Doppler
hset /instrument/doppler/ctrl/run_cmd 1
wait 5
set_chopper_config_with_roi 9.962 20.21 1 1000 0 50 0 255 0 999
wait 5


#drive tc2_driveable 295


# acquisition blocks of x/3600 hrs
set n_run 20
set run_time 3600
histmem mode time
histmem preset $run_time


#samplename 165-136-137_vapor_loading_23.5mbar_inel_295K
samplename Vcyl_noCd


for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
