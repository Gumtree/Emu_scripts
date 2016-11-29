# Sample Environment: CF-3 
# Sample: SBA15 1:1

# Doppler = 2 m/s
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 4.244 40.42 1 600 16 50 68 200 0 599 

# Chopper phase = -58 deg
# chom = 21.5 deg
# mom = 21.0 deg

# Temperature = 300K


histmem mode time
histmem preset 3600

# 2 x 1hr scans
for {set idx0 0} {$idx0 < 2} {incr idx0} {

	histmem start block
	newfile TOTAL_HISTOGRAM_T
	save	
}



