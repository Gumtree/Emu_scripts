

#############################################################
histmem stop

hset instrument/doppler/ctrl/run_cmd 0
wait 5

set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999
wait 5

samplename S4_initial_EFW_300K
runscan dummy_motor 10 14 8 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

hset /sample/tc1/pres7/setpoint 50
wait 1200

#(<300K cool with VTI, set needle valve???)

samplename S4_initial_EFW_300K_a
runscan dummy_motor 10 14 8 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }


hset /sample/tc3/sensor/setpoint1 1
hset /sample/tc3/sensor/setpoint2 1


samplename S4_EFW_cooling_300K_30K
runscan dummy_motor 10 14 190 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }



############################################################################################
