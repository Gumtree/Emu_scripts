
#CF-12, L2_puck, cold stick

histmem stop

#############################################################
#hset instrument/doppler/ctrl/run_cmd 0
#wait 30

#set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

##############################################################
samplename elastic_C3H8_D2O_gas_loading_stick_270K
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

########################################################################################
hset /sample/tc1/temp0/setpoint 1
hset /sample/tc2/temp6/setpoint 1
hset /sample/tc2/temp0/setpoint 1

samplename elastic_C3H8_D2O_gas_loading_stick_260-5K_b
runscan dummy_motor 10 14 150 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

###########################################################################################
#hset /sample/tc1/pres3/setpoint 5

