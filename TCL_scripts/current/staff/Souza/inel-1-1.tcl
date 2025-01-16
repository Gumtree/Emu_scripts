
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
hset /instrument/chpr/background/reqgear 1
wait 1200
# chopper and Doppler histogram configuration 
set_chopper_config_with_roi 9.962 40.42 1 1000 0 50 0 255 0 999
#set_chopper_config_with_roi 9.962 20.21 1 1000 0 50 0 255 0 999
#wait 2

# acquisition blocks of x/3600 hrs
set n_run 1
set run_time 3600
histmem mode time
histmem preset $run_time

hset /instrument/chpr/background/reqphase -88
wait 30

samplename Vcyl30-300K-He_reqphase_inel

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

hset /instrument/chpr/background/reqphase -97
wait 30

samplename Vcyl30-300K-He_reqphase_inel

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

hset /instrument/chpr/background/reqphase -94
wait 30

samplename Vcyl30-300K-He_reqphase_inel

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

hset /instrument/chpr/background/reqphase -91
wait 30

samplename Vcyl30-300K-He_reqphase_inel

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

hset /instrument/chpr/background/reqphase -85
wait 30

samplename Vcyl30-300K-He_reqphase_inel

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

hset /instrument/chpr/background/reqphase -82
wait 30

samplename Vcyl30-300K-He_reqphase_inel

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

hset /instrument/chpr/background/reqphase -79
wait 30

samplename Vcyl30-300K-He_reqphase_inel

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

newfile clear
histmem stop

