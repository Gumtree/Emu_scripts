histmem stop

#Doppler drive control
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999

samplename triblock_cooling_He_EFW

# sample 
hset /sample/tc3/heater/heaterRange_1 3
wait 1
hset /sample/tc3/sensor/setpoint1 5
wait 1
# VTI
hset /sample/tc1/pres7/setpoint 60
wait 1
hset /sample/tc3/sensor/setpoint3 5
wait 1

runscan dummy_motor 10 14 390 time 60 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

# use force true as follows to override 'instrument not ready'
#runscan dummy_motor 10 14 8 time 60 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX } force true

#tertiary close



