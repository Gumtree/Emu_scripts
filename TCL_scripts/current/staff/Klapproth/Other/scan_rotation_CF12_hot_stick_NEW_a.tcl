#taux: 6.45 10.9 1.0 4.45 0 0 (low BKG)

histmem stop

#Doppler
#set instrument/doppler/ctrl/run_cmd 0 
#ait 3
#et_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999
#ait 3



#runscan som 0 360 360 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

####################################################################################
###########################################################################################################

drive msom -61
wait 3

set savenumber 0
set START_NUMBER 0
set loopnumber 0
 
# Start loop 0 
# Measures 5deg steps at 300K
# start msom is 5deg (relative value, min.)
# start vanadium perpendicular to incident beam
# Data will be saved in one file as a list

samplename EFW_Vanadium_flat_300K_-61-174
histmem mode time
histmem preset 600
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
for {set idx0 0} {$idx0 <24} {incr idx0} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target rotation = [expr $idx0*(-5)+(-61)]
		drive msom [expr $idx0*(-5)+(-61)]
		wait 3
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $idx0
	}
	incr savenumber
	incr loopnumber
}
####################################################################


