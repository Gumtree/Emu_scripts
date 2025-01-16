
histmem stop

# Doppler settings
#hset /instrument/doppler/ctrl/run_cmd 1
#wait 1

# chopper and Doppler histogram configuration 
#set_chopper_config_with_roi 9.962 20.21 1 1000 0 50 0 255 0 999


# acquisition blocks of x/3600 hrs
set n_run 6
set run_time 3780
histmem mode time
histmem preset $run_time

# sample stick heater
hset /sample/tc3/heater/heaterRange_1 3
wait 1
# VTI and sample stick
drive tc3_driveable 263 tc3_driveable3 263 

#wait 600

samplename d-136_R_263K_inel

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

