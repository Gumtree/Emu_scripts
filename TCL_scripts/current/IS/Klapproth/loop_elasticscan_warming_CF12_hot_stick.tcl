#taux: 6.45 10.9 1.0 4.45 0 0 (low BKG)

histmem stop

#############################################################

#set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

samplename empty_can_173K
#runscan dummy_motor 10 14 24 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RENA:ON
tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RSET:1.0

#(>300K stick set point, VTI must be at 300K fixed)
hset /sample/tc1/temp0/setpoint 300K 

hset /sample/tc2/temp0/setpoint 600K


samplename empty_can_600K
runscan dummy_motor 10 14 70 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RENA:OFF