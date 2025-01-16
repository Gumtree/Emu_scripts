
histmem stop

# Doppler settings
#hset /instrument/doppler/ctrl/run_cmd 0
#wait 1
#hset /instrument/doppler/ctrl/amplitude 75
#wait 1
#hset /instrument/doppler/ctrl/velocity 4.7
#wait 1
#hset /instrument/doppler/ctrl/run_cmd 1
#wait 1

# chopper and Doppler histogram configuration 
# (1:1 mode only) set_chopper_config_with_roi 9.962 40.42 1 1000 0 50 0 255 0 999
#set_chopper_config_with_roi 9.962 20.21 1 1000 0 50 0 255 0 999
#wait 2

# acquisition blocks of x/3600 hrs

#300
#####################################################
#sample cryostat temp 
# VTI
hset /sample/tc3/sensor/setpoint3 300
wait 1
# Sample Stick
drive tc3_driveable 300
wait 900

samplename CuZSM-5_300K_inelastic 
set n_run 11
set run_time 3600
histmem mode time
histmem preset $run_time

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
#325
#####################################################
# sample cryostat temp 
# VTI
hset /sample/tc3/sensor/setpoint3 315
wait 1
# Sample Stick
drive tc3_driveable 325
wait 900

samplename CuZSM-5_325K_inelastic 
set n_run 11

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
#350
#####################################################
# sample cryostat temp 
# VTI
hset /sample/tc3/sensor/setpoint3 315
wait 1
# Sample Stick
drive tc3_driveable 350
wait 900

samplename CuZSM-5_350K_inelastic 
set n_run 11

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
#375
#####################################################
# sample cryostat temp 
# VTI
hset /sample/tc3/sensor/setpoint3 315
wait 1
# Sample Stick
drive tc3_driveable 375
wait 900

samplename CuZSM-5_375K_inelastic 
set n_run 24

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

