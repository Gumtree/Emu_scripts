 
histmem stop

hset /instrument/doppler/ctrl/run_cmd 0
wait 3
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 3

samplename Vanadium_cooling

hset /sample/tc1/pres3/setpoint 50
drive tc1_temp0_setpoint 300 tc3_driveable2 300
wait 600

#############################################################

#ramp needle valve
tc1_queue send SET:DEV:DB4.G1:PRES:LOOP:RENA:ON
tc1_queue send SET:DEV:DB4.G1:PRES:LOOP:RSET:0.01
hset /sample/tc1/pres3/setpoint 46

tc1_queue send SET:DEV:DB4.G1:PRES:LOOP:RENA:OFF
tc1_queue send SET:DEV:DB4.G1:PRES:LOOP:RENA:ON
tc1_queue send SET:DEV:DB4.G1:PRES:LOOP:RSET:2
hset /sample/tc1/pres3/setpoint 6

#########################################################################

#Ramp for cryo
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:0.5
hset /sample/tc1/temp0/setpoint 1

#Ramp on for samplestick from lakeshore
hset /sample/tc3/control/ramp_loop_2 1,0.5
wait 1
hset /sample/tc3/sensor/setpoint2 1
wait 1

runscan dummy_motor 10 14 200 time 180 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }
###############################################################################




#off
hset /sample/tc3/control/ramp_loop_2 0,0.5
wait 1
tc1_queue send SET:DEV:DB4.G1:PRES:LOOP:RENA:OFF
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF


####################################################################################

