#taux: 6.45 10.9 1.0 4.45 0 0 (low BKG)

histmem stop

#############################################################

#set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

#samplename Vanadium_RT_top-bottom-heater

#runscan som 0 360 360 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

####################################################################################


#set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999


#drive som 296

###########################################################################################################
set savenumber 0
set START_NUMBER 0
set loopnumber 0
 
# Start loop 0
# Measures 5deg steps till 360deg rotation at 300K
# start som is 296deg (relative value)
# Data will be saved in one file as a list
# Counting time per measurement = 10 minutes
histmem mode time
histmem preset 720
newfile TOTAL_HISTOGRAM_T TOTAL_HISTOGRAM_XT
for {set idx0 0} {$idx0 <59} {incr idx0} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target rotation = [expr $idx0*5+0]
		drive som [expr $idx0*5+0]
		wait 10
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $idx0
	}
	incr savenumber
	incr loopnumber
}
