histmem stop

samplename Ga(H2PO2)3-300MPa-cooling300to10K-He_inel_IFWS

# run a sequence of acquisitions in a loop:
# purpose is enabling simultaneous (temperature) ramping, EFWS, and IFWS

# NUM_ACQS = number of acquisitions in the sequence
# NUM_SEQ = number of sequences to collect over

set NUM_ACQS 3
set NUM_SEQ 60

set chopper_freq 20.21
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
histmem mode time
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX

hset /sample/tc1/pres7/setpoint 60
wait 1
# SET UP AND START TEMPERATURE RAMP
# ramp for VTI
hset /sample/tc3/control/ramp_loop_3 1,0.24
wait 1
hset /sample/tc3/sensor/setpoint3 10
wait 1
# ramp for sample 
hset /sample/tc3/control/ramp_loop_1 1,0.24
wait 1
hset /sample/tc3/sensor/setpoint1 10
wait 1

# specify any Doppler drive parameter remaining constant throughout acquisitions here
doppler ctrl/profile_selector/settings/profile 1
doppler ctrl/profile_selector/settings/amplitude 75

#for {set n 0} {$n < $NUM_SEQ} {incr n $NUM_ACQS} {
# TOTAL_NUM_ACQS = total number of acquisitions
set TOTAL_NUM_ACQS [expr $NUM_SEQ * $NUM_ACQS]
for {set n 0} {$n < $TOTAL_NUM_ACQS} {incr n $NUM_ACQS} {
	
	# monitoring scan progress
	set m [expr $n / $NUM_ACQS]
	broadcast sequence $m
	
	# EFW	
	doppler ctrl/run_cmd 0
	wait 1
	set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
	histmem preset 300
	histmem start block
	save $n
	
	# IFW1
	doppler ctrl/profile_selector/settings/velocity 1.52
	drive doppler_start 1
	set_chopper_config_with_roi 4.710 20.21 1 1000 0 50 0 255 0 999
	histmem preset 450
	histmem start block
	save [expr $n+1]
		
	# IFW2
	histmem start block
	save [expr $n+2]	

}

# SWITCH OFF TEMPERATURE RAMPS
# ramp for VTI
hset /sample/tc3/control/ramp_loop_3 0,0.5
wait 1
hset /sample/tc3/control/ramp_loop_1 0,0.5
wait 1



doppler ctrl/run_cmd 0
newfile clear
histmem stop
