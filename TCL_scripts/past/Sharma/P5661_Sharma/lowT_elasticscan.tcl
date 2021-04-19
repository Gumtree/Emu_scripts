
#set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

# needle valve pres3 at 25 mbar

samplename nasicon_parent_el_baseto400K

tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:0.44

hset /sample/tc2/temp0/setpoint 400

runscan dummy_motor 10 14 200 time 300 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF

