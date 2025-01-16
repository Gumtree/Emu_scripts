# Sample Environment: CF-12 
# Sample: 60W Na-montmorillonite

# Doppler = 0 m/s
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 0 40.42 1 1000 16 50 0 255 0 999 

# Chopper phase = -64 deg
# chom = 21.5 deg
# mom = 21.0 deg
histmem stop

#Doppler: off
#hset /instrument/doppler/ctrl/run_cmd 0
#wait 10

# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 0<VdetHeightBins<255 0<DopTbins<999
set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

# Temperature: Warming from 20K -> 300K

drive tc1_temp0_setpoint 245 tc2_temp6_setpoint 250


# Start loop 0
# Measures 5K temp steps from 20 - 300K ie 280 temp points
# Data will be saved in one file as a list
# Counting time per measurement = 4 minutes

histmem mode time
histmem preset 240
samplename Ca-Mt_reference_heating_250_300K
newfile TOTAL_HISTOGRAM_T TOTAL_HISTOGRAM_XT
for {set idx0 0} {$idx0 < 51} {incr idx0} { 
		broadcast Target temperature = [expr $idx0*1+250]
		drive tc1_temp0_setpoint [expr $idx0*1+245]
		drive tc2_temp6_setpoint [expr $idx0*1+250]
		wait 60
		
		broadcast [tc1_temp0_setpoint] [tc2_temp6_setpoint] 
		histmem start block
		save $idx0
	}

####################################################################################
#Doppler off
hset instrument/doppler/ctrl/run_cmd 1
wait 10

set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
wait 10

histmem mode time
histmem preset 3600


###########################################################################################################
# acquisition 1hour blocks at 300K


drive tc1_temp0_setpoint 295 tc2_temp6_setpoint 300

samplename Ca-Mt_reference_300K
for {set idx0 0} {$idx0 <30} {incr idx0} {
	broadcast loop $idx0 samplename Ca-Mt_reference_300K
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
