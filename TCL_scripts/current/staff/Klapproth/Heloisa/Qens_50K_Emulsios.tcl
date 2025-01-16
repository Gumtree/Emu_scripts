
#CF-12, L2_puck, cold stick


histmem stop
hset /sample/tc3/heater/heaterRange_1 3
hset /sample/msom 45


####################################################################################
####################################################################################

#QENS
# Doppler settings


#temperature
hset /sample/tc1/pres7/setpoint 6
drive tc3_driveable3 50 tc3_driveable 50


# Acquisition

histmem mode time
histmem preset 3600

samplename Emulsion_Antibubbles_R972_50K

for {set idx0 0} {$idx0 < 2} {incr idx0} {
	broadcast loop $idx0  Emulsion_Antibubbles_R972_50K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

###################################################################################

