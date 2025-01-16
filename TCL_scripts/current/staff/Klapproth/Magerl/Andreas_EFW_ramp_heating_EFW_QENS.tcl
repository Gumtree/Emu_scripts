 
histmem stop
hset sample/tc3/heater/heaterRange_1 3 

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 3
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 3

samplename nano-rost_9RH_D2O_EFW_heating

#Set cryo
hset /sample/tc3/sensor/setpoint1 300
hset /sample/tc3/sensor/setpoint3 300

#Needle valve
#hset /sample/tc1/pres7/setpoint 5
#wait 180


#Ramp on for sample stick from Lakeshore
hset /sample/tc3/control/ramp_loop_1 1,1.0
#hset /sample/tc3/control/ramp_loop_3 1,1.0
wait 1
hset /sample/tc3/sensor/setpoint1 400
#hset /sample/tc3/sensor/setpoint3 300
wait 1

runscan dummy_motor 10 14 67 time 90 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }


###############################################################################
############################################################################################

#off
hset /sample/tc3/control/ramp_loop_1 0,1.0
hset /sample/tc3/control/ramp_loop_3 0,1.0

###################################################################################
####################################################################################
#EFW_1

#Set cryo
hset /sample/tc3/sensor/setpoint1 400
hset /sample/tc3/sensor/setpoint3 300
wait 1

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

samplename nano-rost_9RH_D2O_EFW_400K

runscan dummy_motor 10 14 7 time 90 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

#########################################################################
#QENS
#Doppler
hset /instrument/doppler/ctrl/run_cmd 1
wait 1
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 1


histmem mode time
histmem preset 3600

# Acquisition 
samplename nano-rost_9RH_D2O_400K_QENS
for {set idx0 0} {$idx0 < 1} {incr idx0} {
	broadcast loop $idx0 nano-rost_9RH_D2O_400K_QENS
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
###################################################################################
####################################################################################
#EFW_2

#Set cryo
hset /sample/tc3/sensor/setpoint1 400
hset /sample/tc3/sensor/setpoint3 300
wait 1

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

samplename nano-rost_9RH_D2O_EFW_400K

runscan dummy_motor 10 14 7 time 90 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

#########################################################################
#QENS
#Doppler
hset /instrument/doppler/ctrl/run_cmd 1
wait 1
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 1


histmem mode time
histmem preset 3600

# Acquisition 
samplename nano-rost_9RH_D2O_400K_QENS
for {set idx0 0} {$idx0 < 1} {incr idx0} {
	broadcast loop $idx0 nano-rost_9RH_D2O_400K_QENS
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
###################################################################################
####################################################################################
#EFW_3

#Set cryo
hset /sample/tc3/sensor/setpoint1 400
hset /sample/tc3/sensor/setpoint3 300
wait 1

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

samplename nano-rost_9RH_D2O_EFW_400K

runscan dummy_motor 10 14 7 time 90 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

#########################################################################
#QENS
#Doppler
hset /instrument/doppler/ctrl/run_cmd 1
wait 1
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 1


histmem mode time
histmem preset 3600

# Acquisition 
samplename nano-rost_9RH_D2O_400K_QENS
for {set idx0 0} {$idx0 < 1} {incr idx0} {
	broadcast loop $idx0 nano-rost_9RH_D2O_400K_QENS
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
###################################################################################
####################################################################################
#EFW_4

#Set cryo
hset /sample/tc3/sensor/setpoint1 400
hset /sample/tc3/sensor/setpoint3 300
wait 1

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

samplename nano-rost_9RH_D2O_EFW_400K

runscan dummy_motor 10 14 7 time 90 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

#########################################################################
#QENS
#Doppler
hset /instrument/doppler/ctrl/run_cmd 1
wait 1
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 1


histmem mode time
histmem preset 3600

# Acquisition 
samplename nano-rost_9RH_D2O_400K_QENS
for {set idx0 0} {$idx0 < 1} {incr idx0} {
	broadcast loop $idx0 nano-rost_9RH_D2O_400K_QENS
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
###################################################################################
####################################################################################
#EFW_5

#Set cryo
hset /sample/tc3/sensor/setpoint1 400
hset /sample/tc3/sensor/setpoint3 300
wait 1

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

samplename nano-rost_9RH_D2O_EFW_400K

runscan dummy_motor 10 14 7 time 90 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

#########################################################################
#QENS
#Doppler
hset /instrument/doppler/ctrl/run_cmd 1
wait 1
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 1


histmem mode time
histmem preset 3600

# Acquisition 
samplename nano-rost_9RH_D2O_400K_QENS
for {set idx0 0} {$idx0 < 1} {incr idx0} {
	broadcast loop $idx0 nano-rost_9RH_D2O_400K_QENS
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
###################################################################################
####################################################################################
#EFW_6

#Set cryo
hset /sample/tc3/sensor/setpoint1 400
hset /sample/tc3/sensor/setpoint3 300
wait 1

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

samplename nano-rost_9RH_D2O_EFW_400K

runscan dummy_motor 10 14 7 time 90 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

#########################################################################
#QENS
#Doppler
hset /instrument/doppler/ctrl/run_cmd 1
wait 1
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 1


histmem mode time
histmem preset 3600

# Acquisition 
samplename nano-rost_9RH_D2O_400K_QENS
for {set idx0 0} {$idx0 < 1} {incr idx0} {
	broadcast loop $idx0 nano-rost_9RH_D2O_400K_QENS
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
###################################################################################
####################################################################################
#EFW_7

#Set cryo
hset /sample/tc3/sensor/setpoint1 400
hset /sample/tc3/sensor/setpoint3 300
wait 1

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

samplename nano-rost_9RH_D2O_EFW_400K

runscan dummy_motor 10 14 7 time 90 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

#########################################################################
#QENS
#Doppler
hset /instrument/doppler/ctrl/run_cmd 1
wait 1
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 1


histmem mode time
histmem preset 3600

# Acquisition 
samplename nano-rost_9RH_D2O_400K_QENS
for {set idx0 0} {$idx0 < 1} {incr idx0} {
	broadcast loop $idx0 nano-rost_9RH_D2O_400K_QENS
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
###################################################################################
####################################################################################
#EFW_8

#Set cryo
hset /sample/tc3/sensor/setpoint1 400
hset /sample/tc3/sensor/setpoint3 300
wait 1

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

samplename nano-rost_9RH_D2O_EFW_400K

runscan dummy_motor 10 14 7 time 90 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

#########################################################################
#QENS
#Doppler
hset /instrument/doppler/ctrl/run_cmd 1
wait 1
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 1


histmem mode time
histmem preset 3600

# Acquisition 
samplename nano-rost_9RH_D2O_400K_QENS
for {set idx0 0} {$idx0 < 1} {incr idx0} {
	broadcast loop $idx0 nano-rost_9RH_D2O_400K_QENS
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
###################################################################################
####################################################################################
#EFW_9

#Set cryo
hset /sample/tc3/sensor/setpoint1 400
hset /sample/tc3/sensor/setpoint3 300
wait 1

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

samplename nano-rost_9RH_D2O_EFW_400K

runscan dummy_motor 10 14 7 time 90 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

#########################################################################
#QENS
#Doppler
hset /instrument/doppler/ctrl/run_cmd 1
wait 1
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 1


histmem mode time
histmem preset 3600

# Acquisition 
samplename nano-rost_9RH_D2O_400K_QENS
for {set idx0 0} {$idx0 < 1} {incr idx0} {
	broadcast loop $idx0 nano-rost_9RH_D2O_400K_QENS
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
###################################################################################
####################################################################################
#EFW_10

#Set cryo
hset /sample/tc3/sensor/setpoint1 400
hset /sample/tc3/sensor/setpoint3 300
wait 1

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

samplename nano-rost_9RH_D2O_EFW_400K

runscan dummy_motor 10 14 7 time 90 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

#########################################################################
#QENS
#Doppler
hset /instrument/doppler/ctrl/run_cmd 1
wait 1
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 1


histmem mode time
histmem preset 3600

# Acquisition 
samplename nano-rost_9RH_D2O_400K_QENS
for {set idx0 0} {$idx0 < 1} {incr idx0} {
	broadcast loop $idx0 nano-rost_9RH_D2O_400K_QENS
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
