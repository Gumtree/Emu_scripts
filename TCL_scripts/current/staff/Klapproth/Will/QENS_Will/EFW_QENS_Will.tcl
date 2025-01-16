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

hset sample/tc2/temp6/auto 1



#Doppler off
hset instrument/doppler/ctrl/run_cmd 0
wait 10

set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

samplename Na-Mt_5M_NaCl_EFW
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

#(<300K cool with VTI, set 5K below stick set point)
hset /sample/tc1/temp0/setpoint 15 
hset /sample/tc2/temp6/setpoint 20


samplename Na-Mt_5M_NaCl_EFW_cooling_300-20K
runscan dummy_motor 10 14 168 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }


drive tc1_temp0_setpoint 15 tc2_temp6_setpoint 20

histmem mode time
histmem preset 240

samplename Na-Mt_5M_NaCl_heating_20_300K
newfile TOTAL_HISTOGRAM_T TOTAL_HISTOGRAM_XT
for {set idx0 0} {$idx0 < 281} {incr idx0} { 
		broadcast Target temperature = [expr $idx0*1+20]
		drive tc1_temp0_setpoint [expr $idx0*1+15]
		drive tc2_temp6_setpoint [expr $idx0*1+20]
		wait 60
		
		broadcast [tc1_temp0_setpoint] [tc2_temp6_setpoint] 
		histmem start block
		save $idx0
	}

##################################################################################### 
#Doppler on
hset instrument/doppler/ctrl/run_cmd 1 
wait 10
set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 10

histmem mode time
histmem preset 3600

drive tc1_temp0_setpoint 295 tc2_temp6_setpoint 300

#acquisition of  12 x 1 hour blocks 
samplename Na-Mt_5M_NaCl_300K
for {set idx0 0} {$idx0 < 12} {incr idx0} {
	broadcast loop $idx0  Ca-Mt_5M_CaCl2_300K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}