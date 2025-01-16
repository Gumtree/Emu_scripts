 
histmem stop

hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 2


samplename Mb-D2O-MPS-10to300K_el

hset /sample/tc3/heater/heaterRange_2 0
wait 1
drive tc3_driveable2 10
hset /sample/tc3/heater/heaterRange_2 3
wait 1
hset /sample/tc1/pres3/setpoint 8
wait 1

wait 300

#Ramp for cryostat
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
wait 1
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:0.5
wait 1
hset /sample/tc1/temp0/setpoint 300
#Ramp for samplestick
hset /sample/tc3/control/ramp_loop_2 1,0.5
wait 1
hset /sample/tc3/sensor/setpoint2 300
wait 1

runscan dummy_motor 10 14 590 time 60 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }


tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF
hset /sample/tc3/control/ramp_loop_2 0,1.0


#tertiary close
