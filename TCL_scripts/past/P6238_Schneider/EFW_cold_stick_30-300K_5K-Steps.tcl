# Sample Environment: CF-12, cold stick, needle valve 30mbar
# Sample: PDMS-10K-melt, Gerald)

# Doppler = 0 m/s (EFW)
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

#Low Background Mode
# Chopper phase = -64 deg
# chom = 21.5 deg
# mom = 21.0 deg  

histmem stop

set savenumber 0
set START_NUMBER 0
set loopnumber 0

# Drive temperature to 30K, 
drive tc1_temp0_setpoint 25
drive tc2_temp6_setpoint 30
drive tc1_pres3_setpoint 30
wait 300 

# Temperature: Warming from 30K -> 300K
# For temperatures above 50K, activate control of tc2_temp6
hset sample/tc2/temp6/auto 1



# Start loop 0
# Measures 5K temp steps from 30 - 125K ie 20 temp points
# Data will be saved in one file as a list
# Counting time per measurement = 10 minutes

broadcast heat1_30-125K
histmem mode time
histmem preset 600
newfile TOTAL_HISTOGRAM_T TOTAL_HISTOGRAM_XT
samplename PDMS-10K-melt_heat1
for {set idx0 0} {$idx0 < 20} {incr idx0} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx0*5+30]
		
		drive tc1_temp0_setpoint [expr $idx0*5+25]  
		drive tc2_temp6_setpoint [expr $idx0*5+30] 
	 
		wait 60
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $idx0
	}
	incr savenumber
	incr loopnumber
}

# Start loop 1
# Measures 5K temp steps from 130 - 225K ie 20 temp points
# Data will be saved in one file as a list
# Counting time per measurement = 10 minutes

broadcast heat2_130-225K
histmem mode time
histmem preset 600
newfile TOTAL_HISTOGRAM_T TOTAL_HISTOGRAM_XT
samplename PDMS-10K-melt_heat2
for {set idx1 0} {$idx1 < 20} {incr idx1} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx1*5+130]
		
		drive tc1_temp0_setpoint [expr $idx1*5+125]
		drive tc2_temp6_setpoint [expr $idx1*5+130]		
		
		wait 60
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $idx1
	}
	incr savenumber
	incr loopnumber
}

# Start loop 2
# Measures 5K temp steps from 230 - 300K ie 15   temp points
# Data will be saved in one file as a list
# Counting time per measurement = 10 minutes

broadcast heat3_230-300K
histmem mode time
histmem preset 600
newfile TOTAL_HISTOGRAM_T TOTAL_HISTOGRAM_XT
samplename PDMS-10K-melt_heat3
for {set idx2 0} {$idx2 < 15} {incr idx2} {
	if {$START_NUMBER <= $loopnumber} {
		broadcast Target temperature = [expr $idx2*5+230]
		
		drive tc1_temp0_setpoint [expr $idx2*5+225]
		drive tc2_temp6_setpoint [expr $idx2*5+230]
		
		wait 60
		broadcast CURRENT LOOP = $loopnumber
		histmem start block
		save $idx2
	}
	incr savenumber
	incr loopnumber
}

#cool from 300K to 260K
drive tc1_pres3_setpoint 50
drive tc1_temp0_setpoint 255
drive tc2_temp6_setpoint 260
drive tc1_pres3_setpoint 15
wait 300

histmem stop

#change EMU from EFW to QENS mode 
hset /instrument/doppler/ctrl/run_cmd 1
wait 30
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 30

# acquisition 14 blocks of 1 hour

histmem stop
histmem mode time
histmem preset 3600

samplename PDMS-10K-melt_260K  
for {set idx0 0} {$idx0 < 14} {incr idx0} {
	broadcast loop $idx0 PDMS-10K-melt_260K  
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

