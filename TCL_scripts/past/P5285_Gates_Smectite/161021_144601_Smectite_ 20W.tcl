# Sample Environment: CF-3 
# Sample:Na smectite 20W

# Doppler = 0 m/s
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 0 40.42 1 600 16 50 68 200 0 599 

# Direct neutrons [9.9 12.3 0 0 0 0]
# Analysed neutrons [4 6.4 0 0 0 0]

# Chopper phase = -58 deg
# chom = 21.5 deg


#Use highest power setting on heater
#hset /sample/tc1/heater/heaterRange 5
#temperature ramp on LakeShore 0.2deg/min (ramp)

#Temperature ramp from 300K - 280K
# New radiation shield and temp sensor in place
# Measure 5 min

histmem mode time
histmem preset 300


for {set idx0 0} {$idx0 < 300} {incr idx0} {

	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save	
}



