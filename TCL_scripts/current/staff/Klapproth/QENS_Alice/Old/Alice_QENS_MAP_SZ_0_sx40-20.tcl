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
drive sz 0
wait 3
drive sx 40
wait 3

samplename Vanadium_sx_40_20_sz_0
for {set idx0 0} {$idx0 < 5} {incr idx0} {
	
	broadcast loop $idx0 Vanadium_sx_40_20_sz_0
	broadcast sx = [expr $idx0*(-5)+(40)], sz = 0
	
	drive sx [expr $idx0*(-5)+(40)] 
	wait 3
		
	broadcast value [sx], value [sz] 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
	}

##################################################################################################
################################################################################################




