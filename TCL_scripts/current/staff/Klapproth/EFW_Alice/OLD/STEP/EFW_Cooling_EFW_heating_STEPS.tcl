
histmem stop
hset sample/tc2/temp0/auto 1

#############################################################

#hset instrument/doppler/ctrl/run_cmd 0
#wait 10

#set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999
#wait 10

#samplename semi_CO2_TBAB_5_initial_EFW
#runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

#(<300K cool with VTI, set 5K below stick set point)
#hset /sample/tc1/temp0/setpoint 1
#hset /sample/tc2/temp6/setpoint 1


#samplename Na_Mt_sample2_140wt_300-20K
#runscan dummy_motor 10 14 170 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }



#EFW ############################################################################################

drive tc1_temp0_setpoint 15 tc2_temp6_setpoint 20
wait 60

histmem mode time   
histmem preset 240

samplename Na_Mt_sample2_140wt_20-300K
newfile TOTAL_HISTOGRAM_T TOTAL_HISTOGRAM_XT RAW_TOTAL_HISTOGRAM_XTAUX
for {set idx0 0} {$idx0 < 281} {incr idx0} {
	broadcast Target temperature = [expr $idx0*1+20]
	
	drive tc1_temp0_setpoint [expr $idx0*1+15]
	drive tc2_temp6_setpoint [expr $idx0*1+20]
	wait 60
	
	broadcast [tc1_temp0_setpoint] [tc2_temp6_setpoint]
	histmem start block
	broadcast [tc1_temp0_setpoint] [tc2_temp6_setpoint]
	
	save $idx0
}

