
histmem stop


hset instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999
wait 1


##############################################################################################
#rotate 35 deg.

drive msom -10
wait 3

samplename collimator_1sheet_RT
runscan dummy_motor 10 14 5 time 3600 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX }


##############################################################################################
#rotate 35 deg.

drive msom -20
wait 3

samplename collimator_1sheet_RT
runscan dummy_motor 10 14 8 time 3600 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX }

drive msom 0