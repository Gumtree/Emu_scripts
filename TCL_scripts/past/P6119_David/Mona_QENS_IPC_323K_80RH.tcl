# Sample Environment: VD-1 dynamic mode & MONA room-temp-holder 
# Sample: S1_Lipid diphytanoyIPC 

# Doppler = 4.7 m/s
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999


# Direct neutrons & Analysed neutrons 3 time sets
# low BKG mode; tAUX time channels [6.45 10.9 1 4.45 0 0] (set 0 analysed, set 1 direct, set 2 rest) (top to bottom)


# Chopper phase = -64 deg
# chom = 21.5deg
# Chopper = BC = -2426 rpm
# background chopper = GC= 1213 rpm

histmem stop

histmem mode time
histmem preset 3600




# acquisition 3 blocks of 1 hour at 323K, 80 RH

#drive tc1_driveable 323
    
samplename MONA_diphytanoyIPC_323K_80RH_equi
for {set idx0 0} {$idx0 <3} {incr idx0} {
	broadcast loop $idx0  MONA_diphytanoyIPC_323K_80RH_equi
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


# acquisition 15 blocks of 1 hour at 323K, 80 RH

#drive tc1_driveable 323

    
samplename MONA_diphytanoyIPC_323K_80RH
for {set idx0 0} {$idx0 <16} {incr idx0} {
	broadcast loop $idx0  MONA_diphytanoyIPC_323K_80RH
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

drive tc1_driveable 288

