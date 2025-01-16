histmem stop

# run a sequence of acquisitions in a loop:
# purpose is enabling simultaneous (temperature) ramping, EFWS, and IFWS

# NUM_ACQS = number of acquisitions in the sequence
# NUM_SEQ = number of sequences to collect over

# example hypothetical ramp from 0 to 300K at 1K/min, and
# acquire for (1,2,2) minutes.
set NUM_ACQS 2
####
# the following may be used to calculate NUM_SEQ directly
# !! but Doppler drive settling times needed to be factored in manually !!
# SEQ_ACQ_TIME = total duration (s) for the sequence of acquisitions
# TOTAL_ACQ_TIME = this should be chosen to match or exceed ramp duration (s)
set SEQ_ACQ_TIME [expr 60 + 120 + 120]
set TOTAL_ACQ_TIME 18000
set NUM_SEQ [expr int($TOTAL_ACQ_TIME / $SEQ_ACQ_TIME) + 5]
####
# alternatively, pass NUM_SEQ directly e.g.
# set NUM_SEQ 47

set chopper_freq 20.21
set_chopper_config_with_roi 0 $chopper_freq 1 1000 0 50 0 255 0 999
histmem mode time
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX

# SET UP AND START TEMPERATURE RAMP HERE

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
	hmm configure fat_frame_frequency 0
	hmm configure fat_frame_aux_frequency $chopper_freq
	hmm init
	histmem preset 60
	histmem start block
	save $n
	
	# IFW1
	doppler ctrl/profile_selector/settings/velocity 3.5
	drive doppler_start 1
	hmm configure fat_frame_frequency 9.077
	hmm configure fat_frame_aux_frequency $chopper_freq
	hmm init
	histmem preset 60
	histmem start block
	save [expr $n+1]
	
	# IFW2
	doppler ctrl/profile_selector/settings/velocity 2.5
	drive doppler_start 1
	hmm configure fat_frame_frequency 7.223
	hmm configure fat_frame_aux_frequency $chopper_freq
	hmm init
	histmem preset 60
	histmem start block
	save [expr $n+2]
	
}

doppler ctrl/run_cmd 0
newfile clear
histmem stop
