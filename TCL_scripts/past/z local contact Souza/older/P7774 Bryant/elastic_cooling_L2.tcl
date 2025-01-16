 
histmem stop


#hset /instrument/doppler/ctrl/run_cmd 0
#wait 3
#set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
#wait 3


samplename Tre_H2O_50%_el_coolingto10K
samplename DTre_D2O_50%_qenchmonitor10K

#hset /sample/tc1/temp0/setpoint 10


runscan dummy_motor 10 14 300 time 75 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX } force true






#tertiary close
