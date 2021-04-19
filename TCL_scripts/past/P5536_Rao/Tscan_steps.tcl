# Sample Environment: CF-1 
# Sample:LiAlGePO, 0.5mm gap, annular can

# Doppler = 0 m/s, FEW
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 0 40.42 1 500 16 50 68 200 0 499 

# Direct neutrons [9.9 12.3 0 0 0 0]
# Analysed neutrons [4 6.4 0 0 0 0]

# Chopper phase = -58 deg
# chom = 21.5 deg
# Chopper = BC = 2426 rpm




histmem mode time
histmem preset 240

#hupdate /sample/tc1/control/settleTime_Loop_1 30
#hupdate /sample/tc1/control/tolerance1 3

#drive tc1_driveable 69

#hupdate /sample/tc1/control/settleTime_Loop_1 30
#hupdate /sample/tc1/control/tolerance1 2

# Temperature = baseK - RT (303K)
broadcast heat1
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
samplename LiAlPO_heat1_RT
for {set idx0 0} {$idx0 < 150} {incr idx0} {
	broadcast loop $idx0 
	#broadcast target [expr $idx0*5+69] 
	#drive tc1_driveable [expr $idx0*5+69]
	#wait 240 
	broadcast [tc1_driveable] 
	histmem start block
	save $idx0
}

#drive tc1_driveable 415  


