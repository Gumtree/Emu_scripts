# Sample Environment: CF-12
# High temperature stick
# Sample: Vanadium

# Doppler  v = 4.7 m/s, A = 75mm
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399

# Low background mode i.e. bchs = 1213 rpm, mode = 1:2
# set_chopper_config_with_roi 9.9625 20.21 1 1000 16 50 0 255 0 999 
# Configure SAT [6.45 10.9 1.0 4.45 0 0]

# Chopper phase = -58 deg
# chom = 21.5 deg
# mom = 21 deg

histmem mode time
histmem preset 3600

# Temperature = 300K
drive tc2_temp0_setpoint 300

# 2 x 1hr scans
for {set idx0 0} {$idx0 < 2} {incr idx0} {

	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save	
}

# For temperatures above 300K, increase VTI pressure
drive tc1_pres3_setpoint 10

# Temperature = 423K
drive tc2_temp0_setpoint 423

# 2 x 1hr scans
for {set idx0 0} {$idx0 < 2} {incr idx0} {

	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save	
}

# Temperature = 300K
drive tc2_temp0_setpoint 300

# Once back to 300K, decrease VTI pressure
drive tc1_pres3_setpoint 5

