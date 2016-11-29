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
histmem preset 1

#drive tc1_temp0_setpoint 278 tc2_temp0_setpoint 278
#wait 900 

#drive tc1_temp0_setpoint 300 tc2_temp0_setpoint 330 (besser als nacheinander)

# Temperature = 278K - 300K
broadcast heat1
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
samplename Phy16H_heat1
for {set idx0 0} {$idx0 < 12} {incr idx0} {
	broadcast target [expr $idx0*2+278] 
	#drive tc1_temp0_setpoint [expr $idx0*2+278] tc2_temp0_setpoint [expr $idx0*2+278]
	#wait 240 
	broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	histmem start block
	save $idx0
}


# Temperature = 302K - 354K
broadcast heat2
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
samplename Phy16H_heat2
for {set idx0 0} {$idx0 < 27} {incr idx0} {
	broadcast target [expr $idx0*2+300]
	#drive tc2_temp0_setpoint [expr $idx0*2+300]
	#wait 240
	broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	histmem start block
	save $idx0
}


# Cooling 354K - 330K

#run tc1_temp0_setpoint 300 tc2_temp0_setpoint 308



