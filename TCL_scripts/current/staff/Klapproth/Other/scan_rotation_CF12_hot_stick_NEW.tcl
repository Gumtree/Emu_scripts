#taux: 6.45 10.9 1.0 4.45 0 0 (low BKG)

histmem stop

#Doppler
hset instrument/doppler/ctrl/run_cmd 0 
wait 3
set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999
wait 3



#runscan som 0 360 360 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

####################################################################################
###########################################################################################################

drive msom -174
wait 60

set savenumber 0
set START_NUMBER 0
set loopnumber 0
 
# Start loop 0 
# Measures 5deg steps at 300K
# start msom is 5deg (relative value, min.)
# start vanadium perpendicular to incident beam
# Data will be saved in one file as a list

samplename EFW_Vanadium_flat_300K_-174-174
histmem mode time
histmem preset 660
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
for {set idx0 0} {$idx0 <69} {incr idx0} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target rotation = [expr $idx0*5+(-174)]
		drive msom [expr $idx0*5+(-174)]
		wait 20
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $idx0
	}
	incr savenumber
	incr loopnumber
}
####################################################################


