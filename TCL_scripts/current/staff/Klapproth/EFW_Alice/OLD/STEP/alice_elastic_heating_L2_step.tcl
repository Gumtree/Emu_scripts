 
histmem stop

hset /instrument/doppler/ctrl/run_cmd 0
wait 3
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999
wait 3


histmem mode time
histmem preset 180

drive tc1_temp0_setpoint 245 tc2_temp6_setpoint 250
wait 300

newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
samplename Emim-FeBr4_heating_steps_2

for {set idx0 0} {$idx0 < 50} {incr idx0} {
	broadcast target [expr $idx0*(1)+250]
	
	drive tc1_temp0_setpoint [expr $idx0*(1)+245]
	drive tc2_temp6_setpoint [expr $idx0*(1)+250]
	
	wait 180
	broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	histmem start block
	broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	save $idx0
}




drive tc1_temp0_setpoint 300 tc2_temp6_setpoint 300
wait 900


histmem mode time
histmem preset 180

newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
samplename Emim-FeBr4_cooling_steps_1

for {set idx0 0} {$idx0 <25} {incr idx0} {
	broadcast target [expr $idx0*(1)+300]
	
	
	drive tc2_temp6_setpoint [expr $idx0*(1)+300]
	
	wait 180
	broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	histmem start block
	broadcast [tc1_temp0_setpoint] [tc2_temp0_setpoint]
	save $idx0
}