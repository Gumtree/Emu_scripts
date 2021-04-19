 
histmem stop


samplename LWO_hyd_el_300to550K
hset /instrument/doppler/ctrl/run_cmd 0
wait 15
set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999
#hset /sample/tc1/pres3/setpoint 60
tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:0.50
hset /sample/tc2/temp0/setpoint 550
runscan dummy_motor 10 14 110 time 300 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }



#tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF

#switch Doppler off
#set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999
#histmem mode unlimited
#histmem start
#histmem stop
#newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T
#save



