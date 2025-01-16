
#CF-11, H1_puck, hot stick
# exchange gas 20mbar

histmem stop
hset sample/tc2/heater/heaterRange_1 2

#############################################################

###################################################################################

#Temperature
hset /sample/tc1/pres3/setpoint 6

#drive tc3_driveable 300 tc2_driveable 323
#hset /sample/tc1/pres3/setpoint 6
#wait 300

#Doppler
hset instrument/doppler/ctrl/run_cmd 1
wait 1
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 1

#QENS
histmem mode time
histmem preset 1800

samplename Lys_Si_dry_323K
for {set idx0 0} {$idx0 <28} {incr idx0} {
	broadcast loop $idx0 Lys_Si_dry_323K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

###################################################################################


#Temperature
hset /sample/tc1/pres3/setpoint 60
hset /sample/tc3/sensor/setpoint1 280
hset /sample/tc2/sensor/setpoint1 283

