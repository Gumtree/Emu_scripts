 
histmem stop


hset /instrument/doppler/ctrl/run_cmd 0
wait 3
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 3


samplename GS0M_el_330Kto230K


hset /sample/tc3/sensor/setpoint1 330
drive tc1_temp0_setpoint 315


#Ramp for cryo
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:0.55
hset /sample/tc1/temp0/setpoint 230

#Ramp for samplestick
hset /sample/tc3/control/ramp_loop_1 1,0.5
hset /sample/tc3/sensor/setpoint1 230


runscan dummy_motor 10 14 210 time 60 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }







#hset /sample/tc2/control/ramp_loop_1 0,1.0
#tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF


#tertiary close
