 
histmem stop

hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 2


samplename tert-butyl.chloride_baseTto295K_el

#wait 1800

# ramp for VTI
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
wait 1
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:0.33
wait 1
hset /sample/tc1/temp0/setpoint 295
wait 1
# ramp for H2
hset /sample/tc3/control/ramp_loop_2 1,0.33
wait 1
hset /sample/tc3/sensor/setpoint2 295
wait 1

runscan dummy_motor 10 14 600 time 90 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }


tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF
hset /sample/tc3/control/ramp_loop_2 0,1.0

#tertiary close



