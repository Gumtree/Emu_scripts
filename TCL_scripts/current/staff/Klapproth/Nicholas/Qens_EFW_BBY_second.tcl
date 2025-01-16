
#CF-12, L2_puck, cold stick

histmem stop
hset /sample/tc3/heater/heaterRange_1 3


####################################################################################
####################################################################################


###############################################################################
############################################################################################
###############################################################################################

#QENS_100K
#Doppler settings
hset /instrument/doppler/ctrl/run_cmd 1
wait 1
set_chopper_config_with_roi 9.962 20.21 1 1000 0 50 0 255 0 999
wait 1


#temperature
hset /sample/tc1/pres7/setpoint 6
wait 300
drive tc3_driveable3 100 tc3_driveable 100

# Acquisition
histmem mode time
histmem preset 1800

samplename BBY_100K

for {set idx0 0} {$idx0 < 24} {incr idx0} {
	broadcast loop $idx0 BBY_100K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

#######################################################################################
##############################################################################################
#############################################################################################

#EFW_heating
#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

#temperature
hset /sample/tc1/pres7/setpoint 6
#wait 300
hset /sample/tc3/sensor/setpoint1 100
hset /sample/tc3/sensor/setpoint3 100
wait 1

samplename BBY_heating_EFW

#Ramp on for sample stick from Lakeshore

hset /sample/tc3/control/ramp_loop_1 1,1.0
hset /sample/tc3/control/ramp_loop_3 1,1.0
wait 1
hset /sample/tc3/sensor/setpoint1 300
hset /sample/tc3/sensor/setpoint3 300
wait 1

runscan dummy_motor 10 14 210 time 60 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

#######################################################################################
#ramp off
hset /sample/tc3/control/ramp_loop_1 0,1.0
hset /sample/tc3/control/ramp_loop_3 0,1.0
wait 1

###################################################################################

#temperature
drive tc3_driveable3 300 tc3_driveable 300

#Const. T
samplename BBY-300K_EFW_after
runscan dummy_motor 10 14 10 time 60 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

############################################################################################
##############################################################################
##################################################################################################

#QENS_300K
#Doppler settings
hset /instrument/doppler/ctrl/run_cmd 1
wait 1 
set_chopper_config_with_roi 9.962 20.21 1 1000 0 50 0 255 0 999
wait 1


#temperature
hset /sample/tc1/pres7/setpoint 6
drive tc3_driveable3 300 tc3_driveable 300


# Acquisition
histmem mode time
histmem preset 1800

samplename BBY_300K_after

for {set idx0 0} {$idx0 < 24} {incr idx0} {
	broadcast loop $idx0 BBY_300K_after
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

