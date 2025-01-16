 
histmem stop

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 3
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 3

samplename trupro_D2O_EFW_298-363K

#Set cryo
hset /sample/tc3/sensor/setpoint2 293

#Ramp on for sample stick from Lakeshore
hset /sample/tc3/control/ramp_loop_1 1,0.5
wait 1
hset /sample/tc3/sensor/setpoint1 363
wait 1

runscan dummy_motor 10 14 44 time 180 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

###############################################################################
############################################################################################

#off
hset /sample/tc3/control/ramp_loop_1 0,0.5
wait 1

###################################################################################
####################################################################################
#Doppler
hset /instrument/doppler/ctrl/run_cmd 1
wait 3
set_chopper_config_with_roi 9.962 20.21 1 1000 0 50 0 255 0 999
wait 3

histmem mode time
histmem preset 3600

drive tc3_driveable 363 tc3_driveable2 293
wait 600

#acquisition of 12 x 1 hour blocks 
samplename trupro_D2O_363K
for {set idx0 0} {$idx0 < 12 } {incr idx0} {
	broadcast loop $idx0  trupro_D2O_363K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
#################################################################################

