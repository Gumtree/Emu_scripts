
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
drive tc3_driveable3 250 tc3_driveable 250


# Acquisition

histmem mode time
histmem preset 3600

samplename Emulsion_bubbles_A200_250K

for {set idx0 0} {$idx0 < 2} {incr idx0} {
	broadcast loop $idx0  Emulsion_bubbles_A200_250K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

###################################################################################

