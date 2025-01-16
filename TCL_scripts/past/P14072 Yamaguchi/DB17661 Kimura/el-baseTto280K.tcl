histmem stop

#Doppler drive control
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999


samplename MPS_NH4PO4-baseTto280300K_el

# SET UP AND START TEMPERATURE RAMP
# ramp for VTI
hset /sample/tc1/control/ramp_loop_1 1,0.5
wait 1
hset /sample/tc1/sensor/setpoint1 280
wait 1
# ramp for sample 
hset /sample/tc1/control/ramp_loop_2 1,0.5
wait 1
hset /sample/tc1/sensor/setpoint2 280
wait 1

runscan dummy_motor 10 14 570 time 60 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

# SWITCH OFF TEMPERATURE RAMPS
# ramp for VTI
hset /sample/tc1/control/ramp_loop_1 0, 1.0
wait 1
hset /sample/tc1/control/ramp_loop_2 0, 1.0
wait 1

# use force true as follows to override 'instrument not ready'
#runscan dummy_motor 10 14 8 time 60 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX } force true

#tertiary close



