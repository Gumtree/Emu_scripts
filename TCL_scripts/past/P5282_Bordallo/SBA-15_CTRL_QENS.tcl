# Sample Environment: CF-12 
# Sample: SBA15 CTRL

# Doppler = 2 m/s
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 4.244 20.21 1 1000 16 50 0 255 0 999 

# Chopper phase = -64 deg
# chom = 21.5 deg
# mom = 21.0 deg

# Temperature = 20K


histmem mode time
histmem preset 3600

# 2 x 1hr scans
for {set idx0 0} {$idx0 < 2} {incr idx0} {

	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T TOTAL_HISTOGRAM_YT TOTAL_HISTOGRAM_XY RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save	
}



