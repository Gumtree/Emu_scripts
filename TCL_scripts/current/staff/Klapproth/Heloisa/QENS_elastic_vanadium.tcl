
#CF-12, L2_puck, cold stick


histmem stop
hset sample/tc3/heater/heaterRange_1 3
hset /sample/msom 45 

##########################################################################

#QENS
# Doppler settings
hset /instrument/doppler/ctrl/profile_selector/settings/profile 0
wait 1
hset /instrument/doppler/ctrl/profile_selector/settings/amplitude 75
wait 1
hset /instrument/doppler/ctrl/profile_selector/settings/velocity 4.7
wait 1
hset /instrument/doppler/ctrl/profile_selector/start 1
wait 45

# Doppler: on (Doppler = 4.7 m/s, 75mm)
hset /instrument/doppler/ctrl/run_cmd 1
#wait 1

# chopper and Doppler histogram configuration
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399 
set_chopper_config_with_roi 9.962 20.21 1 1000 0 50 0 255 0 999
wait 1

#temperature
#hset /sample/tc1/pres7/setpoint 6
#drive tc3_driveable3 300 tc3_driveable 300


# Acquisition

histmem mode time
histmem preset 3600

samplename vanadium_cylinder_300K

for {set idx0 0} {$idx0 < 3} {incr idx0} {
	broadcast loop $idx0  vanadium_cylinder_300K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

#######################################################################################
########################################################################################


#EFW
#Doppler
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 1

#cryo setting
#hset /sample/tc1/pres7/setpoint 60
#wait 300

#hset /sample/tc3/sensor/setpoint1 50
#hset /sample/tc3/sensor/setpoint3 1

samplename vanadium_cylinder_300K_elastic

runscan dummy_motor 10 14 3 time 200 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

####################################################################################


###################################################################################

hset /sample/msom 0 
