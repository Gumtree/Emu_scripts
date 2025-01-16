 
histmem stop
hset sample/tc3/heater/heaterRange_1 3 

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

samplename P1-DC_heating

#drive tc3_driveable3 50 tc3_driveable 50

#Needle valve
#hset /sample/tc1/pres7/setpoint 5
#wait 900


#Ramp on for sample stick from Lakeshore
hset /sample/tc3/control/ramp_loop_1 1,2.0
hset /sample/tc3/control/ramp_loop_3 1,2.0
wait 1
hset /sample/tc3/sensor/setpoint1 320
hset /sample/tc3/sensor/setpoint3 300
wait 1

runscan dummy_motor 10 14 30 time 120 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }


###############################################################################
############################################################################################

#off
hset /sample/tc3/control/ramp_loop_1 0,2.0
hset /sample/tc3/control/ramp_loop_3 0,2.0

###################################################################################
####################################################################################

#Needle valve
#hset /sample/tc1/pres7/setpoint 10

#Set cryo

wait 1
hset /sample/tc3/sensor/setpoint3 1
wait 1
hset /sample/tc3/sensor/setpoint1 1


