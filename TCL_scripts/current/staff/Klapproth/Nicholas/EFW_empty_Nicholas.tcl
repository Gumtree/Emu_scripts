
#CF-12, L2_puck, cold stick


histmem stop
hset sample/tc3/heater/heaterRange_1 3

##########################################################################
#######################################################################################
########################################################################################


#EFW
#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

####################################################################################

#cryo setting
#hset /sample/tc1/pres7/setpoint 60


samplename vanadium_EFW

#Ramp on for sample stick from Lakeshore


#hset /sample/tc3/sensor/setpoint1 200
#hset /sample/tc3/sensor/setpoint3 200
#wait 1

runscan dummy_motor 10 14 3 time 300 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

###############################################################################
############################################################################################


###################################################################################


