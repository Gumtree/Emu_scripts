
histmem stop
hset sample/tc3/heater/heaterRange_1 3 

# Doppler settings
hset /instrument/doppler/ctrl/profile_selector/settings/profile 0
wait 1
hset /instrument/doppler/ctrl/profile_selector/settings/amplitude 75
wait 1
hset /instrument/doppler/ctrl/profile_selector/settings/velocity 4.7
wait 1
hset /instrument/doppler/ctrl/profile_selector/start 1
wait 45

#################################################################################

# Doppler: on (Doppler = 4.7 m/s, 75mm)
hset /instrument/doppler/ctrl/run_cmd 1
wait 3

# chopper and Doppler histogram configuration
set_chopper_config_with_roi 9.962 20.21 1 1000 0 50 0 255 0 999
wait 3

#temperature
#hset /sample/tc1/pres3/setpoint 6
drive tc3_driveable3 300 tc3_driveable 333


# Acquisition

histmem mode time
histmem preset 1800

samplename 20%SPIA_0.5mm_gap_333K

for {set idx0 0} {$idx0 < 20} {incr idx0} {
	broadcast loop $idx0  20%SPIA_0.5mm_gap_333K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
###################################################################################
###############################################################################################
#Doppler off
hset /instrument/doppler/ctrl/run_cmd 0
wait 3
# chopper and Doppler histogram configuration
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999

samplename 20%SPIA_0.5mm_gap_363K_EFW

#Ramp on for sample stick from Lakeshore
#hset /sample/tc1/pres3/setpoint 6
hset /sample/tc3/control/ramp_loop_1 1,1.0
hset /sample/tc3/control/ramp_loop_3 1,1.0
wait 1
hset /sample/tc3/sensor/setpoint1 363
hset /sample/tc3/sensor/setpoint3 300
wait 1


runscan dummy_motor 10 14 20 time 90 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

#################################################################################

# Doppler: on (Doppler = 4.7 m/s, 75mm)
hset /instrument/doppler/ctrl/run_cmd 1
wait 3

# chopper and Doppler histogram configuration
set_chopper_config_with_roi 9.962 20.21 1 1000 0 50 0 255 0 999
wait 3

#temperature
#hset /sample/tc1/pres3/setpoint 6
drive tc3_driveable3 300 tc3_driveable 363


# Acquisition

histmem mode time
histmem preset 1800

samplename 20%SPIA_0.5mm_gap_363K

for {set idx0 0} {$idx0 < 20} {incr idx0} {
	broadcast loop $idx0  20%SPIA_0.5mm_gap_363K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
###################################################################################

#Temperature ramp off
hset /sample/tc3/control/ramp_loop_1 0,1.0
hset /sample/tc3/control/ramp_loop_3 0,1.0


#Temperature
hset /sample/tc1/pres3/setpoint 60
hset /sample/tc3/sensor/setpoint3 290
hset /sample/tc3/sensor/setpoint1 298
