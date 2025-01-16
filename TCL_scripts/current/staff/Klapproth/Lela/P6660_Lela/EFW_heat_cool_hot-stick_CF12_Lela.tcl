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


histmem stop

#Doppler: off
hset /instrument/doppler/ctrl/run_cmd 0
wait 10

# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 0<VdetHeightBins<255 0<DopTbins<999
set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

histmem mode time
histmem preset 180

drive tc2_temp0_setpoint 298

# Temperature = 298K - 350K
broadcast heat
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
samplename PT_D2Oexcess_FEW_heat
for {set idx0 0} {$idx0 < 104} {incr idx0} {
	broadcast target [expr $idx0*0.5+298]
	run tc2_temp0_setpoint [expr $idx0*0.5+298]
	#wait 240
	broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	histmem start block
	save $idx0
}


# Cooling 350K - 298K
drive tc2_temp0_setpoint 350

# Temperature = 350 - 298K
broadcast cool
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
samplename PT_D2Oexcess_FEW_cool
for {set idx0 0} {$idx0 < 104} {incr idx0} {
	broadcast target [expr $idx0*(-0.5)+350]
	run tc2_temp0_setpoint [expr $idx0*(-0.5)+350]
	#wait 240
	broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	histmem start block
	save $idx0
}





