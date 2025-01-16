# Sample Environment: CF-12 
# Sample: annular can
# Chopper phase = -88 deg
# chom = 21.5 deg
# GC =  2426 rpm, BC = 1213 rpm
# Doppler = 4.7 m/s, 75 mm




# continue QENS

histmem stop

# Doppler: on
hset /instrument/doppler/ctrl/run_cmd 1
wait 10

# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 0<VdetHeightBins<255 0<DopTbins<999
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999

histmem mode time
histmem preset 3600

#set temperature -cold stick
drive tc1_temp0_setpoint 277 tc2_temp6_setpoint 278
wait 60

# measure QENS
broadcast QENS-278K

samplename 20pc-SLES-CAPB-0pcNaCl_278K
for {set idx0 0} {$idx0 <13} {incr idx0} {
	broadcast loop $idx0 samplename 20pc-SLES-CAPB-0pcNaCl_278K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

# temperature test
drive tc1_temp0_setpoint 283 tc2_temp6_setpoint 288
wait 1800
drive tc1_temp0_setpoint 295 tc2_temp6_setpoint 298 
wait 1800
drive tc1_temp0_setpoint 305 tc2_temp6_setpoint 308
wait 1800


