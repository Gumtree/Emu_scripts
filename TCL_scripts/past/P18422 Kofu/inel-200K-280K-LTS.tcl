
histmem stop

# Doppler settings
#hset /instrument/doppler/ctrl/profile_selector/settings/profile 0
#wait 1
#hset /instrument/doppler/ctrl/profile_selector/settings/amplitude 75
#wait 1
#hset /instrument/doppler/ctrl/profile_selector/settings/velocity 4.7
#wait 1
#hset /instrument/doppler/ctrl/profile_selector/settings/offset 0
#wait 1
#drive doppler_start 1
# chopper and Doppler histogram configuration 
# (1:1 mode only) set_chopper_config_with_roi 9.962 40.42 1 1000 0 50 0 255 0 999
#set_chopper_config_with_roi 9.962 20.21 1 1000 0 50 0 255 0 999
#wait 2


# 200K
# acquisition blocks of x/3600 hrs
set n_run 7
set run_time 3600
histmem mode time
histmem preset $run_time

samplename h-martyite-200K_inel

drive tc1_driveable 200 tc1_driveable2 200

wait 300

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

# 220K
# acquisition blocks of x/3600 hrs
set n_run 7

samplename h-martyite-220K_inel

drive tc1_driveable 220 tc1_driveable2 220

wait 300

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

# 250K
# acquisition blocks of x/3600 hrs
set n_run 6

samplename h-martyite-250K_inel

drive tc1_driveable 250 tc1_driveable2 250

wait 300

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

# 280K
# acquisition blocks of x/3600 hrs
set n_run 8

samplename h-martyite-280K_inel

drive tc1_driveable 280 tc1_driveable2 280

wait 300

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
