 
histmem stop

hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 2


samplename SBR-4-10to375K_el


# ramp for VTI
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
wait 1
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:0.5
wait 1
hset /sample/tc1/temp0/setpoint 318
wait 1
# ramp for H2
hset /sample/tc3/control/ramp_loop_1 1,0.5
wait 1
hset /sample/tc3/sensor/setpoint1 375
wait 1

runscan dummy_motor 10 14 375 time 120 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }


tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF
hset /sample/tc3/control/ramp_loop_1 0,1.0

#tertiary close



