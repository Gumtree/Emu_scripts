
histmem stop

#############################################################

#set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

#samplename DMPC_333K_80RH_change
#runscan dummy_motor 10 14 4 time 180 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

#(<300K cool with VTI, set 5K below stick set point)
#hset /sample/tc1/sensor/setpoint1 333K

#hset /sample/tc2/temp0/setpoint 100K
samplename DMPC_333K_80RH_equilibration
runscan dummy_motor 10 14 40 time 180 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

