# Sample Environment: CF-12 
# Sample: Vanadium

# Doppler = 2 m/s

# Low background mode i.e. bchs = 1213 rpm, mode = 1:2, bchp = -64 deg
# set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999 
# Configure SAT [6.45 10.9 1.0 4.45 0 0]

# chom = 21.5 deg
# mom = 21.0 deg

# Temperature: 300K

# Counting time per measurement = 60 minutes
histmem mode time
histmem preset 3600

# 12 x 1hr scans
for {set idx0 0} {$idx0 < 12} {incr idx0} {

	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T TOTAL_HISTOGRAM_YT TOTAL_HISTOGRAM_XY RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save	
}



