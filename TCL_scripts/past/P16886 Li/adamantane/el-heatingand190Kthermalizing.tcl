histmem stop

#Doppler drive control
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
#set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999

# sample and VTI
drive tc3_driveable3 190 tc3_driveable 190

samplename Ada-190Kheating-He_el

runscan dummy_motor 10 14 6 time 300 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }


# use force true as follows to override 'instrument not ready'
#runscan dummy_motor 10 14 8 time 60 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX } force true

#tertiary close



