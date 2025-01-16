histmem stop

samplename recycled_vacuum_IFWS

# run a sequence of acquisitions in a loop:
# purpose is enabling simultaneous (temperature) ramping, EFWS, and IFWS

# NUM_ACQS = number of acquisitions in the sequence
# NUM_SEQ = number of sequences to collect over

set NUM_ACQS 4
set NUM_SEQ 8

set chopper_freq 20.21
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
histmem mode time
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX


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
	doppler ctrl/profile_selector/settings/velocity 0.7
	drive doppler_start 1
	set_chopper_config_with_roi 2.265 20.21 1 1000 0 50 0 255 0 999
	histmem preset 270
	histmem start block
	save [expr $n+1]
	
	# IFW2
	doppler ctrl/profile_selector/settings/velocity 1.6
	drive doppler_start 1
	set_chopper_config_with_roi 4.938 20.21 1 1000 0 50 0 255 0 999
	histmem preset 270
	histmem start block
	save [expr $n+2]
	
	# IFW3
	doppler ctrl/profile_selector/settings/velocity 3.5
	drive doppler_start 1
	set_chopper_config_with_roi 9.077 20.21 1 1000 0 50 0 255 0 999
	histmem preset 270
	histmem start block
	save [expr $n+3]
	
}

doppler ctrl/run_cmd 0
newfile clear
histmem stop
