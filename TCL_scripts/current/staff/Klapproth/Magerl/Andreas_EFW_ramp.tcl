 
histmem stop
hset sample/tc3/heater/heaterRange_1 3 

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 3
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 3

samplename nano-rost_9RH_D2O_EFW_Cooling

#Set cryo
hset /sample/tc3/sensor/setpoint1 300
hset /sample/tc3/sensor/setpoint3 300

#Needle valve
hset /sample/tc1/pres7/setpoint 40
wait 180


#Ramp on for sample stick from Lakeshore
hset /sample/tc3/control/ramp_loop_1 1,0.5
hset /sample/tc3/control/ramp_loop_3 1,0.5
wait 1
hset /sample/tc3/sensor/setpoint1 10
hset /sample/tc3/sensor/setpoint3 10
wait 1

runscan dummy_motor 10 14 193 time 180 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

###############################################################################
############################################################################################

#off
hset /sample/tc3/control/ramp_loop_1 0,0.5
hset /sample/tc3/control/ramp_loop_3 0,0.5

###################################################################################
####################################################################################

samplename nano-rost_9RH_D2O_EFW_heating

#Set cryo
hset /sample/tc3/sensor/setpoint1 10
hset /sample/tc3/sensor/setpoint3 10

#Needle valve
hset /sample/tc1/pres7/setpoint 5
wait 180


#Ramp on for sample stick from Lakeshore
hset /sample/tc3/control/ramp_loop_1 1,1.0
hset /sample/tc3/control/ramp_loop_3 1,1.0
wait 1
hset /sample/tc3/sensor/setpoint1 300
hset /sample/tc3/sensor/setpoint3 300
wait 1

runscan dummy_motor 10 14 193 time 90 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

###############################################################################
############################################################################################

#off
hset /sample/tc3/control/ramp_loop_1 0,1.0
hset /sample/tc3/control/ramp_loop_3 0,1.0

###################################################################################
####################################################################################
