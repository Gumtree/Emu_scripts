
#CF-12, L2_puck, cold stick


histmem stop
hset /sample/tc3/heater/heaterRange_1 3


####################################################################################
####################################################################################

#QENS
# Doppler settings

hset /instrument/doppler/ctrl/run_cmd 1
wait 1

# chopper and Doppler histogram configuration 
set_chopper_config_with_roi 9.962 20.21 1 1000 0 50 0 255 0 999
wait 1


#temperature
#hset /sample/tc1/pres7/setpoint 6
#drive tc3_driveable3 300 tc3_driveable 300



# Acquisition

histmem mode time
histmem preset 1800

samplename vanadium_annular_300K

for {set idx0 0} {$idx0 < 6} {incr idx0} {
	broadcast loop $idx0 empty_300K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

###################################################################################

