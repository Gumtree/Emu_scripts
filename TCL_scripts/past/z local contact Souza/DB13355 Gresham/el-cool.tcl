 
histmem stop

# Turn doppler off
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 2

# Cool to 100
hset /sample/tc1/pres7/setpoint 60
wait 1
# SP for VTI
hset /sample/tc3/heater/heaterRange_3 0
wait 1
hset /sample/tc3/sensor/setpoint3 100
wait 1

# SP for H2L2
hset /sample/tc3/heater/heaterRange_1 0
wait 1
hset /sample/tc3/sensor/setpoint1 100
wait 1
# Correct setpoints





# Perform measurement
samplename 200cStPDMS_SiNP_dTol_el_coolingto100K
runscan dummy_motor 10 14 220 time 120 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }
# 7 hours 


# make sure we get to 100 K
hset /sample/tc1/pres7/setpoint 6
wait 1
hset /sample/tc3/heater/heaterRange_3 1
wait 1
hset /sample/tc3/heater/heaterRange_1 3
wait 1
drive tc3_driveable3 100

wait 600







