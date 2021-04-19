 # Sample Environment: CF-12 
# Sample:m-xylene-1.6K, 0.5mm gap???, annular cell

# Doppler = 4.7 m/s
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999


# Direct neutrons & Analysed neutrons 3 time sets
# BKG mode; tAUX time channels [6.45 10.9 1 4.45 0 0] (set 0 analysed, set 1 direct, set 2 rest) (top to bottom)


# Chopper phase = -64 deg
# chom = 21.5 deg
# Chopper = BC = -2426 rpm
# background chopper = GC= 1213 rpm

#drive tc2_temp6_setpoint 1.6
#wait 1800


histmem stop

histmem mode time
histmem preset 3600

drive chom 20.0 
wait 30 

# acquisition 2 blocks of 1 hour at RT

samplename vanadium_chom_20.0
for {set idx0 0} {$idx0 < 2} {incr idx0} {
	broadcast loop $idx0 vanadium_chom_20.0
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

drive chom 20.2 
wait 30 

# acquisition 2 blocks of 1 hour at RT

samplename vanadium_chom_20.2
for {set idx0 0} {$idx0 < 2} {incr idx0} {
	broadcast loop $idx0 vanadium_chom_20.2 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

drive chom 20.4 
wait 30 

# acquisition 2 blocks of 1 hour at RT

samplename vanadium_chom_20.4
for {set idx0 0} {$idx0 < 2} {incr idx0} {
	broadcast loop $idx0 vanadium_chom_20.4 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

drive chom 20.6 
wait 30 

# acquisition 2 blocks of 1 hour at RT

samplename vanadium_chom_20.6
for {set idx0 0} {$idx0 < 2} {incr idx0} {
	broadcast loop $idx0 vanadium_chom_20.6 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

drive chom 20.8 
wait 30 

# acquisition 2 blocks of 1 hour at RT

samplename vanadium_chom_20.8
for {set idx0 0} {$idx0 < 2} {incr idx0} {
	broadcast loop $idx0 vanadium_chom_20.8 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

drive chom 21.0 
wait 30 

# acquisition 2 blocks of 1 hour at RT

samplename vanadium_chom_21.0
for {set idx0 0} {$idx0 < 2} {incr idx0} {
	broadcast loop $idx0 vanadium_chom_21.0
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

drive chom 21.2 
wait 30 

# acquisition 2 blocks of 1 hour at RT

samplename vanadium_chom_21.2
for {set idx0 0} {$idx0 < 2} {incr idx0} {
	broadcast loop $idx0 vanadium_chom_21.2
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

drive chom 21.4 
wait 30 

# acquisition 2 blocks of 1 hour at RT

samplename vanadium_chom_21.4
for {set idx0 0} {$idx0 < 2} {incr idx0} {
	broadcast loop $idx0 vanadium_chom_21.4
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

drive chom 21.6 
wait 30 

# acquisition 2 blocks of 1 hour at RT

samplename vanadium_chom_21.6
for {set idx0 0} {$idx0 < 2} {incr idx0} {
	broadcast loop $idx0 vanadium_chom_21.6
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

drive chom 21.8 
wait 30 

# acquisition 2 blocks of 1 hour at RT

samplename vanadium_chom_21.8
for {set idx0 0} {$idx0 < 2} {incr idx0} {
	broadcast loop $idx0 vanadium_chom_21.8
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

drive chom 22.0 
wait 30 

# acquisition 2 blocks of 1 hour at RT

samplename vanadium_chom_22.0
for {set idx0 0} {$idx0 < 2} {incr idx0} {
	broadcast loop $idx0 vanadium_chom_22.0
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}