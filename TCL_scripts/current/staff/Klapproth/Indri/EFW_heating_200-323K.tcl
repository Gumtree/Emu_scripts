 
histmem stop
hset sample/tc3/heater/heaterRange_1 3 

#EFW
#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1


samplename Lys_wet_EFW_heating 

#Cryo
hset /sample/tc1/pres7/setpoint 6
drive tc3_driveable3 200 tc3_driveable 200
wait 300


#Ramp on for samplestick from lakeshore
hset /sample/tc3/control/ramp_loop_1 1,1    
wait 1
hset /sample/tc3/control/ramp_loop_3 1,1 

hset /sample/tc3/sensor/setpoint1 323
wait 1
hset /sample/tc3/sensor/setpoint3 300

runscan dummy_motor 10 14 84 time 90 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

###############################################################################
############################################################################################

#off
hset /sample/tc3/control/ramp_loop_1 0,1    
wait 1
hset /sample/tc3/control/ramp_loop_3 0,1 

              

####################################################################################

