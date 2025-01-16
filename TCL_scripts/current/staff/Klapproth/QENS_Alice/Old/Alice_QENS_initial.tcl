#mapping beam center using XYZ scanner 

histmem stop

#QENS
#Doppler
hset /instrument/doppler/ctrl/run_cmd 1
wait 1
#set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
#set_chopper_config_with_roi 5.093 20.21 1 1000 16 50 0 255 0 999
set_chopper_config_with_roi 12.734 20.21 1 1000 16 50 0 255 0 999
wait 1

#initial 0,0 (sx,sz)
histmem mode time
histmem preset 3600

# Acquisition 
samplename Vanadium_0_0
for {set idx0 0} {$idx0 < 1} {incr idx0} {
	broadcast loop $idx0 Vanadium_0_0_12Hz
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
###################################################################################
####################################################################################

