 
histmem stop
hset sample/tc3/heater/heaterRange_1 2

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 3
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 3

samplename empty_foil


#temp
drive tc3_driveable3 300 tc3_driveable 385
#wait 600

#Ramp on for sample stick from Lakeshore
hset /sample/tc1/pres7/setpoint 5
wait 300

hset /sample/tc3/control/ramp_loop_1 1,1.0
#hset /sample/tc3/control/ramp_loop_3 1,1.0
wait 1
hset /sample/tc3/sensor/setpoint1 415
#hset /sample/tc3/sensor/setpoint3 298
wait 1

runscan dummy_motor 10 14 6 time 300 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

###############################################################################
############################################################################################

#off
hset /sample/tc3/control/ramp_loop_1 0,1.0
#hset /sample/tc3/control/ramp_loop_3 0,1.0
wait 1

###################################################################################
####################################################################################
#################################################################################

