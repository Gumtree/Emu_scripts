 
histmem stop


hset /instrument/doppler/ctrl/run_cmd 0
wait 3
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 3


hset /sample/tc1/pres3/setpoint 50
wait 1
drive tc1_temp0_setpoint 12 tc3_driveable2 12
hset /sample/tc1/pres3/setpoint 8
wait 1
drive tc1_temp0_setpoint 12 tc3_driveable2 12
wait 900

samplename EFW_empty_12K


#Ramp for cryo
#tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
#tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:0.5
#hset /sample/tc1/temp0/setpoint 12



runscan dummy_motor 10 14 20 time 180 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }
###############################################################################
drive tc1_temp0_setpoint 45 tc3_driveable2 50
wait 900

runscan dummy_motor 10 14 20 time 180 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }
#######################################################################
drive tc1_temp0_setpoint 95 tc3_driveable2 100
wait 900

runscan dummy_motor 10 14 20 time 180 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }
#######################################################################
drive tc1_temp0_setpoint 145 tc3_driveable2 150
wait 900

runscan dummy_motor 10 14 20 time 180 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }
#########################################################################
drive tc1_temp0_setpoint 195 tc3_driveable2 200
wait 900

runscan dummy_motor 10 14 20 time 180 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }
##########################################################################
drive tc1_temp0_setpoint 245 tc3_driveable2 250
wait 900

runscan dummy_motor 10 14 20 time 180 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }
#######################################################################
drive tc1_temp0_setpoint 295 tc3_driveable2 300
wait 900

runscan dummy_motor 10 14 20 time 180 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }
#################################################################





#off
#tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF
#tc2_queue send SET:DEV:DB6.T1:TEMP:LOOP:RENA:OFF

####################################################################################

