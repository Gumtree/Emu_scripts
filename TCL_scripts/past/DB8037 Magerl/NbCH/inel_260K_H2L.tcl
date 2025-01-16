histmem stop

# CF-12 H2 Mercury controller

#Contorling Dopper
hset /instrument/doppler/ctrl/run_cmd 1
wait 5
set_chopper_config_with_roi 6.366 20.21 1 1000 0 50 0 255 0 999
wait 5

#Controlling Temperature 
#hset /sample/tc1/temp0/setpoint 200
drive tc3_driveable 260
#drive tc1_temp0_setpoint 250

# acquisition blocks of x/3600 hrs
set n_run 5
set run_time 3600
histmem mode time
histmem preset $run_time

samplename NbCH0.25_inel_260K

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
