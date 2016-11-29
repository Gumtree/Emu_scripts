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

#drive tc1_temp0_setpoint 300
#drive tc2_temp0_setpoint 330
#wait 1800 


# Temperature = 330K - 354K
broadcast heat3
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
samplename Phy10H_heat2
for {set idx0 0} {$idx0 < 25} {incr idx0} {
	broadcast target [expr $idx0*2+330]
	#drive tc2_temp0_setpoint [expr $idx0*2+330]
	#wait 240
	broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	histmem start block
	save $idx0
}


# Cooling 353K - 330K

run tc1_temp0_setpoint 330


broadcast cool3
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
samplename Phy10H_cool1
for {set idx0 0} {$idx0 < 16} {incr idx0} {
	broadcast target 278
	broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	histmem start block
	save $idx0
}

broadcast cool2
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
samplename Phy10H_cool2
for {set idx0 0} {$idx0 < 16} {incr idx0} {
	broadcast target 278
	broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	histmem start block
	save $idx0
}

