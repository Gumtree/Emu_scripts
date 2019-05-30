# Sample Environment: CF-12 
# Sample:Phytantriol, 10% H2O, 0.2mm gap, annular can

# Doppler = 0 m/s, FEW
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 0 40.42 1 600 16 50 68 200 0 599 

# Direct neutrons [9.9 12.3 0 0 0 0]
# Analysed neutrons [4 6.4 0 0 0 0]

# Chopper phase = -58 deg
# chom = 21.5 deg
# Chopper = BC = 2426 rpm



histmem mode time
histmem preset 240


# Temperature = 278K - 300K
broadcast heat1
set savenumber 0
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
samplename Phy10H_heat1
for {set idx0 0} {$idx0 < 23} {incr idx0} {
	run tc1_temp0_setpoint [expr $idx0*1+278]
	drive tc2_temp0_setpoint [expr $idx0*1+278]
	broadcast target [expr $idx0*1+278] 
	broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	histmem start block
	save $savenumber
	incr savenumber	
}

# Temperature = 301K - 353K
broadcast heat2
set savenumber 0
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
samplename Phy10H_heat2
for {set idx0 0} {$idx0 < 53} {incr idx0} {
	drive tc2_temp0_setpoint [expr $idx0*1+301]
	broadcast target [expr $idx0*1+301]
	broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	histmem start block
	save $savenumber
	incr savenumber	
}



# Cooling 353K - 278K

run tc1_temp0_setpoint 278
run tc2_temp0_setpoint 278

broadcast cool1
set savenumber 0
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
samplename Phy10H_cool1
for {set idx0 0} {$idx0 < 16} {incr idx0} {
	broadcast target 278
	broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	histmem start block
	save $savenumber
	incr savenumber	
}

broadcast cool2
set savenumber 0
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
samplename Phy10H_cool2
for {set idx0 0} {$idx0 < 16} {incr idx0} {
	broadcast target 278
	broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	histmem start block
	save $savenumber
	incr savenumber	
}

broadcast cool3
set savenumber 0
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
samplename Phy10H_cool3
for {set idx0 0} {$idx0 < 16} {incr idx0} {
	broadcast target 278
	broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	histmem start block
	save $savenumber
	incr savenumber	
}






# Temperature = 278K - 300K
broadcast heat1_repeat
set savenumber 0
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
samplename Phy10H_heat1_repeat
for {set idx0 0} {$idx0 < 23} {incr idx0} {
	run tc1_temp0_setpoint [expr $idx0*1+278]
	drive tc2_temp0_setpoint [expr $idx0*1+278]
	broadcast target [expr $idx0*1+278] 
	broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	histmem start block
	save $savenumber
	incr savenumber	
}

# Temperature = 301K - 353K
broadcast heat2_repeat
set savenumber 0
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
samplename Phy10H_heat2_repeat
for {set idx0 0} {$idx0 < 53} {incr idx0} {
	drive tc2_temp0_setpoint [expr $idx0*1+301]
	broadcast target [expr $idx0*1+301] 
	broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	histmem start block
	save $savenumber
	incr savenumber	
}

# Cooling 353K - 278K
broadcast cool_final target 278K
run tc1_temp0_setpoint 278
run tc2_temp0_setpoint 278

