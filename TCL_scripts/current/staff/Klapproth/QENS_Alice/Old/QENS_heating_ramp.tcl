# Sample Environment: CF-12 
# Sample: hot stick

# Doppler = 4.7 m/s, 75mm
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399 

# Direct neutrons & Analysed neutrons 3 time sets
# BKG mode; tAUX time channels [6.45 10.9 1 4.45 0 0] (set 0 analysed, set 1 direct, set 2 rest) (top to bottom)

# Chopper phase = -88 deg
# chom = 21.5deg
# Chopper = GC = -2426 rpm
# background chopper = BC= 1213 rpm

histmem stop

#Doppler: on
hset /instrument/doppler/ctrl/run_cmd 1
wait 3

set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 3



#Ramp for cryo
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:0.5
hset /sample/tc1/temp0/setpoint 315


#Ramp on for samplestick from lakeshore
hset /sample/tc3/control/ramp_loop_1 1,0.5
wait 1
hset /sample/tc3/sensor/setpoint1 320
wait 1

runscan dummy_motor 10 14 2 time 3600 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX }


histmem mode time
histmem preset 3600

# acquisition 12 blocks of 1 hour


samplename Protein_F_320K
for {set idx0 0} {$idx0 <28} {incr idx0} {
	broadcast loop $idx0 Protein_F_320K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}


#off
hset /sample/tc3/control/ramp_loop_1 0,0.5
wait 1
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF


hset sample/tc1/pres3/setpoint 30
drive tc1_temp0_setpoint 278 tc3_driveable  283

