
#set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999
#drive tc2_temp0_setpoint 100
#wait 1800

#runscan dummy_motor 10 14 50 time 1800 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }


# needle valve pres3 at 25 mbar

samplename p2namn2_el_350to450

tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:0.44

hset /sample/tc2/temp0/setpoint 450

runscan dummy_motor 10 14 50 time 300 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF

# from above timing, ramp complete so just monitor intensity in 15 min slices
#runscan dummy_motor 10 14 50 time 900 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }




