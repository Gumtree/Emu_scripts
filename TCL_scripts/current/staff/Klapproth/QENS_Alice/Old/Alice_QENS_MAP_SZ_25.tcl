#mapping beam center using XYZ scanner 

histmem stop

#QENS
#Doppler
hset /instrument/doppler/ctrl/run_cmd 1
wait 1
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 1

histmem mode time
histmem preset 3600

###################################################################################
####################################################################################


##################################################################################################
################################################################################################

#set scanner
drive sz 25
wait 3
drive sx 25
wait 3

samplename Vanadium_sx_25_-25_SZ_25
for {set idx0 0} {$idx0 < 11} {incr idx0} {
	
	broadcast loop $idx0 Vanadium_sx_25_-25_sz_25
	broadcast sx = [expr $idx0*(-5)+(25)], sz = 25
	
	drive sx [expr $idx0*(-5)+(25)] 
	wait 3
		
	broadcast value [sx], value [sz] 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
	}

##################################################################################################
################################################################################################




