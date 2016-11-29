      # Sample Environment: CF-12 
# Sample:Phytantriol, 10% H2O, 0.2mm gap, annular can

# Doppler = 3 m/s
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 6.367 40.42 1 600 16 50 68 200 0 599


# Direct neutrons [9.9 12.3 0 0 0 0]
# Analysed neutrons [4 6.4 0 0 0 0]

# Chopper phase = -58 deg
# chom = 21.5 deg
# Chopper = BC = 2426 rpm


histmem mode time
histmem preset 3600


# acquisition 8 blocks of 1 hour at 323K

samplename QENS_323K_Phy10H
for {set idx0 0} {$idx0 < 8} {incr idx0} {
	broadcast loop $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


# acquisition 1 blocks of 1 hour during cooling to 10K

run tc1_temp0_setpoint 10
run tc2_temp0_setpoint 10
run tc1_pres3_setpoint 50

broadcast cooling10K
samplename QENS_10K_Phy10H
for {set idx0 0} {$idx0 < 6} {incr idx0} {
	broadcast loop $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

run tc1_pres3_setpoint 5

# acquisition 8 blocks of 1 hour at 10K

broadcast instrument_resolution
samplename QENS_10K_Phy10H
for {set idx0 0} {$idx0 < 20} {incr idx0} {
	broadcast loop $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}




