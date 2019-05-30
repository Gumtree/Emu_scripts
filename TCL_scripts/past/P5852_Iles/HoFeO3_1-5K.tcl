# Sample Environment: CF-12
# Low temperature stick
# Sample: HoFeO3, 0.5mm Al can (old alloy)

# Doppler  v = 4.7 m/s, A = 75mm
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399

# Low background mode i.e. bchs = 1213 rpm, mode = 1:2
# set_chopper_config_with_roi 9.9625 20.21 1 1000 16 50 0 255 0 999 
# Configure SAT [6.45 10.9 1.0 4.45 0 0]

# Chopper phase = -58 deg
# chom = 21.5 deg
# mom = 21 deg

histmem mode time
histmem preset 21600

# Temperature = 1.5K

# 3 x 6hr scans
for {set idx0 0} {$idx0 < 3} {incr idx0} {

	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save	
}

