histmem stop

#set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

wait 3000

# ramp VTI
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:0.34
# for L2
# PID 20 5 0
tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RENA:ON
tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RSET:0.34

#samplename GrOx_dry_el_baset300K

hset /sample/tc1/temp0/setpoint 300
wait 3
hset /sample/tc2/temp6/setpoint 300

# leave scan variables alone!
runscan dummy_motor 10 14 414 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF
tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RENA:OFF

