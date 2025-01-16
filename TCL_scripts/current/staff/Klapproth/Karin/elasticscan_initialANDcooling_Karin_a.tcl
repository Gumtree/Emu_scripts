

#############################################################
histmem stop

hset instrument/doppler/ctrl/run_cmd 0
wait 5

set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999
wait 5




#(<300K cool with VTI, set needle valve???)

hset /sample/tc3/sensor/setpoint1 1
hset /sample/tc3/sensor/setpoint2 1


samplename S1_EFW_cooling_60-30K
runscan dummy_motor 10 14 30 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }



############################################################################################
