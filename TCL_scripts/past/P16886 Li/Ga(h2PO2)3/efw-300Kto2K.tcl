histmem stop

#Doppler drive control
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999

# VTI
hset /sample/tc1/pres7/setpoint 60
wait 1
hset /sample/tc3/sensor/setpoint3 1
wait 1
# sample
hset /sample/tc3/sensor/setpoint1 1
wait 1

samplename Ga(H2PO2)3-300Kto2K-He_el

runscan dummy_motor 10 14 72 time 300 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

wait 1800
hset /sample/tc1/pres7/setpoint 10
wait 1
wait 1800
runscan dummy_motor 10 14 1 time 600 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }


# use force true as follows to override 'instrument not ready'
#runscan dummy_motor 10 14 8 time 60 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX } force true

#tertiary close



