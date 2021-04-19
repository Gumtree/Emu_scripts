
histmem stop

#############################################################

#set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

#histmem mode time
#histmem preset 300

#drive tc2_temp6_setpoint 75
#wait 1800
#samplename AlPO4_75K
#histmem start block
#newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T
#save 

tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RENA:OFF
drive tc2_temp6_setpoint 1.61
wait 1800

samplename el_grapheneOxide_1.6Kto300K
tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RENA:ON
tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RSET:1.0
hset /sample/tc2/temp6/setpoint 300
runscan dummy_motor 10 14 128 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }


tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RENA:OFF

