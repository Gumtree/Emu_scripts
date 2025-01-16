 
histmem stop


hset /instrument/doppler/ctrl/run_cmd 0
wait 5
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 5


samplename Niformate-hydrated_el_50to300K
samplename emptyContainerinCF12

#tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
#tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:1.05
#hset /sample/tc1/temp0/setpoint 300

#hset /sample/tc2/control/ramp_loop_1 1,1.0
#hset /sample/tc2/sensor/setpoint1 300


#runscan dummy_motor 10 14 260 time 60 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }
runscan dummy_motor 10 14 3 time 600 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }


#hset /sample/tc2/control/ramp_loop_1 0,1.0
#tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF


#tertiary close
