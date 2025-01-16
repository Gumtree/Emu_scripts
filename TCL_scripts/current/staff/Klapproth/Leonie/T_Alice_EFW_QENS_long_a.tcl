#########################################################################

#start EFW_0
#Set cryo
hset /sample/tc3/sensor/setpoint1 363
hset /sample/tc3/sensor/setpoint3 298
wait 1

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

samplename YP_NPHOS_NaCl_H2O_0.1_363K_EFW

runscan dummy_motor 10 14 7 time 90 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

#QENS
#Doppler
hset /instrument/doppler/ctrl/run_cmd 1
wait 1
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 1


histmem mode time
histmem preset 3600

# Acquisition 
samplename YP_NPHOS_NaCl_H2O_0.1_363K
for {set idx0 0} {$idx0 < 1} {incr idx0} {
	broadcast loop $idx0  YP_NPHOS_NaCl_H2O_0.1_363K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
###################################################################################
####################################################################################
#EFW_1

#Set cryo
hset /sample/tc3/sensor/setpoint1 363
hset /sample/tc3/sensor/setpoint3 298
wait 1

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

samplename YP_NPHOS_NaCl_H2O_0.1_363K_EFW

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
samplename YP_NPHOS_NaCl_H2O_0.1_363K
for {set idx0 0} {$idx0 < 1} {incr idx0} {
	broadcast loop $idx0 YP_NPHOS_NaCl_H2O_0.1_363K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
###################################################################################
####################################################################################
#EFW_2

#Set cryo
hset /sample/tc3/sensor/setpoint1 363
hset /sample/tc3/sensor/setpoint3 298
wait 1

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

samplename YP_NPHOS_NaCl_H2O_0.1_363K_EFW

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
samplename YP_NPHOS_NaCl_H2O_0.1_363K
for {set idx0 0} {$idx0 < 1} {incr idx0} {
	broadcast loop $idx0 YP_NPHOS_NaCl_H2O_0.1_363K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
###################################################################################
####################################################################################
#EFW_3

#Set cryo
hset /sample/tc3/sensor/setpoint1 363
hset /sample/tc3/sensor/setpoint3 298
wait 1

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

samplename YP_NPHOS_NaCl_H2O_0.1_363K_EFW

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
samplename YP_NPHOS_NaCl_H2O_0.1_363K
for {set idx0 0} {$idx0 < 1} {incr idx0} {
	broadcast loop $idx0 YP_NPHOS_NaCl_H2O_0.1_363K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
###################################################################################
####################################################################################
#EFW_4

#Set cryo
hset /sample/tc3/sensor/setpoint1 363
hset /sample/tc3/sensor/setpoint3 298
wait 1

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

samplename YP_NPHOS_NaCl_H2O_0.1_363K_EFW

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
samplename YP_NPHOS_NaCl_H2O_0.1_363K
for {set idx0 0} {$idx0 < 1} {incr idx0} {
	broadcast loop $idx0 YP_NPHOS_NaCl_H2O_0.1_363K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
###################################################################################
####################################################################################
#EFW_5

#Set cryo
hset /sample/tc3/sensor/setpoint1 363
hset /sample/tc3/sensor/setpoint3 298
wait 1

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

samplename YP_NPHOS_NaCl_H2O_0.1_363K_EFW

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
samplename YP_NPHOS_NaCl_H2O_0.1_363K
for {set idx0 0} {$idx0 < 1} {incr idx0} {
	broadcast loop $idx0 YP_NPHOS_NaCl_H2O_0.1_363K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
###################################################################################
####################################################################################
#EFW_6

#Set cryo
hset /sample/tc3/sensor/setpoint1 363
hset /sample/tc3/sensor/setpoint3 298
wait 1

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

samplename YP_NPHOS_NaCl_H2O_0.1_363K_EFW

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
samplename YP_NPHOS_NaCl_H2O_0.1_363K
for {set idx0 0} {$idx0 < 1} {incr idx0} {
	broadcast loop $idx0 YP_NPHOS_NaCl_H2O_0.1_363K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
###################################################################################
####################################################################################
#EFW_7

#Set cryo
hset /sample/tc3/sensor/setpoint1 363
hset /sample/tc3/sensor/setpoint3 298
wait 1

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

samplename YP_NPHOS_NaCl_H2O_0.1_363K_EFW

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
samplename YP_NPHOS_NaCl_H2O_0.1_363K
for {set idx0 0} {$idx0 < 1} {incr idx0} {
	broadcast loop $idx0 YP_NPHOS_NaCl_H2O_0.1_363K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
###################################################################################
####################################################################################
#EFW_8

#Set cryo
hset /sample/tc3/sensor/setpoint1 363
hset /sample/tc3/sensor/setpoint3 298
wait 1

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

samplename YP_NPHOS_NaCl_H2O_0.1_363K_EFW

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
samplename YP_NPHOS_NaCl_H2O_0.1_363K
for {set idx0 0} {$idx0 < 1} {incr idx0} {
	broadcast loop $idx0 YP_NPHOS_NaCl_H2O_0.1_363K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
###################################################################################
####################################################################################
#EFW_9

#Set cryo
hset /sample/tc3/sensor/setpoint1 363
hset /sample/tc3/sensor/setpoint3 298
wait 1

#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

samplename YP_NPHOS_NaCl_H2O_0.1_363K_EFW

runscan dummy_motor 10 14 7 time 90 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

#########################################################################

#Needle valve
hset /sample/tc1/pres7/setpoint 20
wait 180

samplename YP_NPHOS_NaCl_H2O_0.1_363K_EFW_cooling

#Ramp on for sample stick from Lakeshore
hset /sample/tc3/control/ramp_loop_1 1,0.5
#hset /sample/tc3/control/ramp_loop_3 1,1.0
wait 1
hset /sample/tc3/sensor/setpoint1 298
hset /sample/tc3/sensor/setpoint3 50
wait 1

runscan dummy_motor 10 14 89 time 120 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }
###################################################################################
####################################################################################
