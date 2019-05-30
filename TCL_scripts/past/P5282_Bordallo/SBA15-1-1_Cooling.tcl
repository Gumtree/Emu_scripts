# Sample Environment: CF-1 
# Sample: SBA15 1:1

# Doppler = 0 m/s
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 0 40.42 1 500 16 50 68 200 0 499 

# Chopper phase = -58 deg
# chom = 21.5 deg

# Temperature: Cooling from 300K -> 20K


histmem mode time
histmem preset 3600

# 4 x 1hr scans
for {set idx0 0} {$idx0 < 4} {incr idx0} {

	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save	
}

# Set temperature = 20K
drive tc1_driveable 20
wait 300


