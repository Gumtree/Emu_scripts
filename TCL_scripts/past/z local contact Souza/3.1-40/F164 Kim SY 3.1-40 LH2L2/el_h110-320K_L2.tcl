 
histmem stop

hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 2


samplename OSM-1-110to320K_el

# cooling
hset /sample/tc1/pres3/setpoint 60
wait 1
hset /sample/tc1/temp0/setpoint 1
wait 1
hset /sample/tc3/heater/heaterRange_2 0
wait 1
drive tc3_driveable2 110
hset /sample/tc3/heater/heaterRange_2 3 
wait 1
hset /sample/tc1/pres3/setpoint 8
wait 1
hset /sample/tc1/temp0/setpoint 110
wait 900

# ramp for VTI
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
wait 1
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:0.5
wait 1
hset /sample/tc1/temp0/setpoint 318
wait 1
# ramp for H2
hset /sample/tc3/control/ramp_loop_2 1,0.5
wait 1
hset /sample/tc3/sensor/setpoint2 320
wait 1

runscan dummy_motor 10 14 220 time 120 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }


tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF
hset /sample/tc3/control/ramp_loop_2 0,1.0

#tertiary close



