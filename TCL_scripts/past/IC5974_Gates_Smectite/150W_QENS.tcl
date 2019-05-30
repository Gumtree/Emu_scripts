# Sample Environment: CF-12 
# Sample: 20W, 3mm gap, gas-loading

# Doppler  v = 2 m/s, A = 25mm
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 12.734 40.42 1 1000 16 50 0 255 0 999 


# Chopper phase = -58 deg
# chom = 21.5 deg
# mom = 21 deg

# Temperature = 300K

histmem mode time
histmem preset 3600

# 3 x 1hr scans
for {set idx0 0} {$idx0 < 3} {incr idx0} {

	histmem start block
	newfile TOTAL_HISTOGRAM_T
	save	
}



