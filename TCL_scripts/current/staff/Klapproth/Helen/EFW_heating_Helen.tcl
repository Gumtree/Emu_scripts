 
histmem stop
hset sample/tc3/heater/heaterRange_1 3 

#EFW
#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1


samplename sample_1_H_heating_third 

#Cryo
drive tc3_driveable3 300 tc3_driveable 298
wait 300 

#Ramp on for samplestick from lakeshore
hset /sample/tc3/control/ramp_loop_1 1,0.2    
wait 1

hset /sample/tc3/sensor/setpoint1 423
wait 1


runscan dummy_motor 10 14 127 time 300 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

###############################################################################
############################################################################################

#off
hset /sample/tc3/control/ramp_loop_1 0,0.2 
wait 1 
              

####################################################################################

