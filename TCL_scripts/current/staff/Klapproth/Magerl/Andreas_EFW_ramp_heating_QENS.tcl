 
histmem stop
hset sample/tc3/heater/heaterRange_1 3 

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 3
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 3

samplename nano-rost_78RH_D2O_EFW_heating

#Set cryo
hset /sample/tc3/sensor/setpoint1 2
hset /sample/tc3/sensor/setpoint3 2

#Needle valve
#hset /sample/tc1/pres7/setpoint 5
#wait 180


#Ramp on for sample stick from Lakeshore
hset /sample/tc3/control/ramp_loop_1 1,1.0
hset /sample/tc3/control/ramp_loop_3 1,1.0
wait 1
hset /sample/tc3/sensor/setpoint1 350
hset /sample/tc3/sensor/setpoint3 300
wait 1

runscan dummy_motor 10 14 241 time 90 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }


###############################################################################
############################################################################################

#off
hset /sample/tc3/control/ramp_loop_1 0,1.0
hset /sample/tc3/control/ramp_loop_3 0,1.0

###################################################################################
####################################################################################

#QENS
#Doppler
hset /instrument/doppler/ctrl/run_cmd 1
wait 1
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 1


histmem mode time
histmem preset 3600

# Acquisition 
samplename nano-rost_9RH_D2O_350K_QENS
for {set idx0 0} {$idx0 < 10} {incr idx0} {
	broadcast loop $idx0 nano-rost_9RH_D2O_350K_QENS
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
###################################################################################
####################################################################################
