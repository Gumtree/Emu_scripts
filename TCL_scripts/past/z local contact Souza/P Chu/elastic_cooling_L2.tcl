 
histmem stop


#hset /instrument/doppler/ctrl/run_cmd 0
#wait 3
#set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
#wait 3


samplename GO8nm0p58mg_el_295Kto230K


#Ramp for cryo
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:0.5
hset /sample/tc1/temp0/setpoint 220

#Ramp for samplestick
tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RENA:ON
tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RSET:0.5
hset /sample/tc2/temp6/setpoint 220

runscan dummy_motor 10 14 222 time 60 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }



tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF
tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RENA:OFF



#tertiary close
