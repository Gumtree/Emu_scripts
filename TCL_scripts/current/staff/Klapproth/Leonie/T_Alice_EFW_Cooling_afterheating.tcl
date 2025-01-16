histmem stop
hset sample/tc3/heater/heaterRange_1 3 


###################################################################################
####################################################################################
#EFW_0

#Set cryo
hset /sample/tc3/sensor/setpoint1 363
hset /sample/tc3/sensor/setpoint3 298
wait 1

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

samplename PBS_H2O_0.1_363K_EFW

runscan dummy_motor 10 14 7 time 90 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

#########################################################################
#EFW_cooling

#Needle valve
hset /sample/tc1/pres7/setpoint 20
wait 180

samplename PBS_H2O_0.1_363K_EFW_cooling

#Ramp on for sample stick from Lakeshore
hset /sample/tc3/control/ramp_loop_1 1,0.5
#hset /sample/tc3/control/ramp_loop_3 1,1.0
wait 1
hset /sample/tc3/sensor/setpoint1 298
hset /sample/tc3/sensor/setpoint3 50
wait 1

runscan dummy_motor 10 14 67 time 120 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

#stop ramp
hset /sample/tc3/control/ramp_loop_1 0,0.5

#Needle valve
hset /sample/tc1/pres7/setpoint 5
wait 180

###################################################################################
####################################################################################
