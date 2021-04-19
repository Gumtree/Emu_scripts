# Sample Environment: CF-10 
# Sample:empty can, 0.2mm gap, annular can

# Doppler = 4.7 m/s
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 9.962 40.42 1 1000 16 50 0 255 0 999


# Direct neutrons [9.9 12.3 0 0 0 0]
# Analysed neutrons [4 6.4 0 0 0 0]

# Chopper phase = -58 deg
# chom = 21.5 deg
# Chopper = BC = 2426 rpm



histmem mode time
histmem preset 3600



# acquisition 15 blocks of 1 hour during cooling

samplename CF-10_empty_containerWithCd_1.5K
#can_no_mask
for {set idx0 0} {$idx0 < 8} {incr idx0} {
	broadcast loop $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

