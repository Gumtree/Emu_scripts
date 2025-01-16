 
histmem stop

# CF-12 H2 Lakeshore controller

#hset /instrument/doppler/ctrl/run_cmd 0
#wait 5
#set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
#wait 5

#drive tc3_driveable 10

samplename NbCH0.25_el_35to400K

# TC1(Mercury) control
#tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
#tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:0.5
#hset /sample/tc1/temp0/setpoint 318.5

# TC3(LS336) control
hset /sample/tc3/control/ramp_loop_1 1,2.0
hset /sample/tc3/sensor/setpoint1 400


runscan dummy_motor 10 14 155 time 75 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

# TC3(LS336) control Ramp OFF
hset /sample/tc3/control/ramp_loop_1 0,0.5
# TC1(Mercury) control Ramp OFF
#tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF


#tertiary close
