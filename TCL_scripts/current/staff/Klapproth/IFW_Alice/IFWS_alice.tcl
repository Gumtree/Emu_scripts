histmem stop

samplename Glycerol_He_IFWS

# run a sequence of acquisitions in a loop:
# purpose is enabling simultaneous (temperature) ramping, EFWS, and IFWS

# NUM_ACQS = number of acquisitions in the sequence
# NUM_SEQ = number of sequences to collect over

set NUM_ACQS 2
set NUM_SEQ 109

set chopper_freq 20.21
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
histmem mode time
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX

# SET UP AND START TEMPERATURE RAMP
# ramp for VTI
#hset /sample/tc3/control/ramp_loop_3 1,0.5
#wait 1
#hset /sample/tc3/sensor/setpoint3 315
#wait 1
# ramp for sample 
#hset /sample/tc3/control/ramp_loop_1 1,0.5
#wait 1
#hset /sample/tc3/sensor/setpoint1 315
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
	histmem preset 90
	histmem start block
	save $n
	
	# IFW1
	doppler ctrl/profile_selector/settings/velocity 2.27
	drive doppler_start 1
	set_chopper_config_with_roi 6.692 20.21 1 1000 0 50 0 255 0 999
	histmem preset 270
	histmem start block
	save [expr $n+1]
		

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
