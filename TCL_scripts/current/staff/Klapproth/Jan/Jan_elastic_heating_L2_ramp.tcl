 
histmem stop

drive tc1_temp0_setpoint 12 tc3_driveable2 12
hset /sample/tc1/pres3/setpoint 8

wait 900
drive tc1_temp0_setpoint 12 tc3_driveable2 12
wait 360

hset /instrument/doppler/ctrl/run_cmd 0
wait 3
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 3


samplename Emim_FeBr4_heating

#Ramp for cryo
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:0.5
hset /sample/tc1/temp0/setpoint 250

#Ramp on for samplestick from lakeshore
hset /sample/tc3/control/ramp_loop_2 1,0.5
wait 1
hset /sample/tc3/sensor/setpoint2 250
wait 1

runscan dummy_motor 10 14 159 time 180 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

###############################################################################
############################################################################################



#off
hset /sample/tc3/control/ramp_loop_2 0,0.5
wait 1
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF


####################################################################################

