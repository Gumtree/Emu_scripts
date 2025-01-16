
#CF-11, H1_puck, hot stick
#no exchange gas (pumping)

histmem stop
hset sample/tc2/heater/heaterRange_1 2

#############################################################

##Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

#Temperature

drive tc3_driveable 250 tc2_driveable 280

samplename MSPC-d62_heating

#Ramp on for sample stick from Lakeshore
hset /sample/tc1/pres3/setpoint 6
wait 60
hset /sample/tc2/control/ramp_loop_1 1,0.5
#hset /sample/tc3/control/ramp_loop_3 1,1.0
wait 1
hset /sample/tc2/sensor/setpoint1 330
#hset /sample/tc3/sensor/setpoint3 298
wait 1

runscan dummy_motor 10 14 130 time 60 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

###############################################################################
############################################################################################

#off
hset /sample/tc2/control/ramp_loop_1 0,0.5
#hset /sample/tc3/control/ramp_loop_3 0,1.0
wait 1

###################################################################################

#Temperature
hset /sample/tc1/pres3/setpoint 60

drive tc3_driveable 250 tc2_driveable 323
hset /sample/tc1/pres3/setpoint 6
wait 60

#Doppler
hset instrument/doppler/ctrl/run_cmd 1
wait 1
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 1

#QENS
histmem mode time
histmem preset 1800

samplename MSPC-d62_323K
for {set idx0 0} {$idx0 <44} {incr idx0} {
	broadcast loop $idx0 MSPC-d62_323K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
###############################################################


