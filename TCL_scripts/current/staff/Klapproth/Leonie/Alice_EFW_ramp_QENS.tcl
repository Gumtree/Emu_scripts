 
histmem stop
hset sample/tc3/heater/heaterRange_1 2

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 3
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 3

samplename YP_D2O_PBS 0.5_After_Cooling

#Set cryo
hset /sample/tc1/pres7/setpoint 60
hset /sample/tc3/sensor/setpoint3 100
hset /sample/tc3/sensor/setpoint1 125


runscan dummy_motor 10 14 150 time 180 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }
################################################################################################################################


#Set cryo
drive tc3_driveable3 90 tc3_driveable 125
wait 3

samplename YP_D2O_PBS 0.5_After_Heating

#Ramp on for sample stick from Lakeshore
hset /sample/tc1/pres7/setpoint 8
hset /sample/tc3/control/ramp_loop_1 1,1.0
hset /sample/tc3/control/ramp_loop_3 1,1.0
wait 1
hset /sample/tc3/sensor/setpoint1 298
hset /sample/tc3/sensor/setpoint3 298
wait 1

runscan dummy_motor 10 14 60 time 180 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

###############################################################################
############################################################################################

#off
hset /sample/tc3/control/ramp_loop_1 0,1.0
hset /sample/tc3/control/ramp_loop_3 0,1.0


###################################################################################
####################################################################################
#################################################################################

