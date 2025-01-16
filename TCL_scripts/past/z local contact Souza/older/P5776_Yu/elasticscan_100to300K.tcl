
#set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

# needle valve pres3 at 25 mbar


#histmem mode time
#histmem preset 300


#drive tc2_temp6_setpoint 40
#wait 300
#samplename AlPO4_40K
#histmem start block
#newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T
#save 


#drive tc2_temp6_setpoint 50
#wait 900
#samplename AlPO4_50K
#histmem start block
#newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T
#save 


#drive tc2_temp6_setpoint 75
#wait 1800
#samplename AlPO4_75K
#histmem start block
#newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T
#save 


drive tc2_temp6_setpoint 100
#wait 1800

samplename AlPO4_el_100Kto300K
tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RENA:ON
tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RSET:0.15
hset /sample/tc2/temp6/setpoint 300
runscan dummy_motor 10 14 275 time 300 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }


tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RENA:OFF

