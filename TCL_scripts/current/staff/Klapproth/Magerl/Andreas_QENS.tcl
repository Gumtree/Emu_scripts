 
histmem stop
hset sample/tc3/heater/heaterRange_1 3 



#QENS
#Doppler
hset /instrument/doppler/ctrl/run_cmd 1
wait 1
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 1


histmem mode time
histmem preset 3600

# Acquisition 
samplename Vanadium_250K_QENS
for {set idx0 0} {$idx0 < 24} {incr idx0} {
	broadcast loop $idx0 Vanadium_250K_QENS
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
###################################################################################
####################################################################################
