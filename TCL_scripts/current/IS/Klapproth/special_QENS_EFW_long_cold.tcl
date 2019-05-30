
#CF-12, L2_puck, cold stick

histmem stop


hset instrument/doppler/ctrl/run_cmd 0
wait 10

set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

##############################################################
samplename elastic_C3H8_Xe_D2O_new_263K
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

######################################################################################################################################################################
hset /sample/tc1/temp0/setpoint 255
hset /sample/tc2/temp6/setpoint 260
hset /sample/tc2/temp0/setpoint 260

samplename elastic_C3H8_Xe_D2O_new_cooling260K
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

######################################################################################################################################################################
hset /sample/tc1/temp0/setpoint 245
hset /sample/tc2/temp6/setpoint 250
hset /sample/tc2/temp0/setpoint 250

samplename elastic_C3H8_Xe_D2O_new_cooling250K
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

######################################################################################################################################################################
hset /sample/tc1/temp0/setpoint 235
hset /sample/tc2/temp6/setpoint 240
hset /sample/tc2/temp0/setpoint 240

samplename elastic_C3H8_Xe_D2O_new_cooling240K
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

######################################################################################################################################################################
hset /sample/tc1/temp0/setpoint 225
hset /sample/tc2/temp6/setpoint 230
hset /sample/tc2/temp0/setpoint 230

samplename elastic_C3H8_Xe_D2O_new_cooling230K
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

###########################################################################################
hset /sample/tc1/temp0/setpoint 215
hset /sample/tc2/temp6/setpoint 220
hset /sample/tc2/temp0/setpoint 220

samplename elastic_C3H8_Xe_D2O_new_cooling220K
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

########################################################################################
hset /sample/tc1/temp0/setpoint 205
hset /sample/tc2/temp6/setpoint 210
hset /sample/tc2/temp0/setpoint 210

samplename elastic_C3H8_Xe_D2O_new_210K
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

######################################################################################################################################################################
hset /sample/tc1/temp0/setpoint 195
hset /sample/tc2/temp6/setpoint 200
hset /sample/tc2/temp0/setpoint 200

samplename elastic_C3H8_D2O_new_cooling200K
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }


######################################################################################################################################################################
hset /sample/tc1/temp0/setpoint 185
hset /sample/tc2/temp6/setpoint 190
hset /sample/tc2/temp0/setpoint 190

samplename elastic_C3H8_Xe_D2O_new_cooling190K
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

######################################################################################################################################################################
hset /sample/tc1/temp0/setpoint 175
hset /sample/tc2/temp6/setpoint 180
hset /sample/tc2/temp0/setpoint 180

samplename elastic_C3H8_Xe_D2O_new_cooling180K
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

######################################################################################################################################################################
hset /sample/tc1/temp0/setpoint 165
hset /sample/tc2/temp6/setpoint 170
hset /sample/tc2/temp0/setpoint 170

samplename elastic_C3H8Xe-_D2O_new_cooling170K
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

######################################################################################################################################################################
hset /sample/tc1/temp0/setpoint 155
hset /sample/tc2/temp6/setpoint 160
hset /sample/tc2/temp0/setpoint 160

samplename elastic_C3H8_D2O_new_cooling160K
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

######################################################################################################################################################################
hset /sample/tc1/temp0/setpoint 145
hset /sample/tc2/temp6/setpoint 150
hset /sample/tc2/temp0/setpoint 150

samplename elastic_C3H8_Xe_D2O_new_cooling150K
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

######################################################################################################################################################################
hset /sample/tc1/temp0/setpoint 135
hset /sample/tc2/temp6/setpoint 140
hset /sample/tc2/temp0/setpoint 140

samplename elastic_C3H8_Xe_D2O_new_cooling140K
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

######################################################################################################################################################################
hset /sample/tc1/temp0/setpoint 125
hset /sample/tc2/temp6/setpoint 130
hset /sample/tc2/temp0/setpoint 130

samplename elastic_C3H8_Xe_D2O_new_cooling130K
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

###########################################################################################
hset /sample/tc1/temp0/setpoint 115
hset /sample/tc2/temp6/setpoint 120
hset /sample/tc2/temp0/setpoint 120

samplename elastic_C3H8_Xe_D2O_new_cooling120K
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

########################################################################################
hset /sample/tc1/temp0/setpoint 105
hset /sample/tc2/temp6/setpoint 110
hset /sample/tc2/temp0/setpoint 110

samplename elastic_C3H8_Xe_D2O_new_110K
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

######################################################################################################################################################################
hset /sample/tc1/temp0/setpoint 95
hset /sample/tc2/temp6/setpoint 100
hset /sample/tc2/temp0/setpoint 100

samplename elastic_C3H8_Xe_D2O_new_cooling100K
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

######################################################################################################################################################################
hset /sample/tc1/temp0/setpoint 85
hset /sample/tc2/temp6/setpoint 90
hset /sample/tc2/temp0/setpoint 90

samplename elastic_C3H8_Xe_D2O_new_cooling90K
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

######################################################################################################################################################################
hset /sample/tc1/temp0/setpoint 75
hset /sample/tc2/temp6/setpoint 80
hset /sample/tc2/temp0/setpoint 80

samplename elastic_C3H8_Xe_D2O_new_cooling80K
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }


######################################################################
hset /sample/tc1/temp0/setpoint 65
hset /sample/tc2/temp6/setpoint 70
hset /sample/tc2/temp0/setpoint 70

samplename elastic_C3H8_Xe_D2O_new_cooling70K
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

######################################################################
hset /sample/tc1/temp0/setpoint 55
hset /sample/tc2/temp6/setpoint 60
hset /sample/tc2/temp0/setpoint 60

samplename elastic_C3H8_Xe_D2O_new_cooling60K
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

###########################################################################################
hset /sample/tc1/temp0/setpoint 45
hset /sample/tc2/temp6/setpoint 50
hset /sample/tc2/temp0/setpoint 50

samplename elastic_C3H8_Xe_D2O_new_cooling50K
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

#############################################################################################
hset /sample/tc1/temp0/setpoint 35
hset /sample/tc2/temp6/setpoint 40
hset /sample/tc2/temp0/setpoint 40

samplename elastic_C3H8_Xe_D2O_new_cooling40K
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

#######################################################################
hset /sample/tc1/temp0/setpoint 25
hset /sample/tc2/temp6/setpoint 30
hset /sample/tc2/temp0/setpoint 30

samplename elastic_C3H8_Xe_D2O_new_cooling30K
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

###########################################################################################
hset /sample/tc1/temp0/setpoint 15
hset /sample/tc2/temp6/setpoint 20
hset /sample/tc2/temp0/setpoint 20

samplename elastic_C3H8_Xe_D2O_new_cooling20K
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }


########################################################################################
hset /sample/tc1/temp0/setpoint 5
hset /sample/tc2/temp6/setpoint 10
hset /sample/tc2/temp0/setpoint 10

samplename elastic_C3H8_Xe_D2O_new_10K
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

########################################################################################
hset /sample/tc1/pres3/setpoint 5 
hset /sample/tc1/temp0/setpoint 1
hset /sample/tc2/temp6/setpoint 1
hset /sample/tc2/temp0/setpoint 1

samplename elastic_C3H8_Xe_D2O_new_1K6
runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }


###################################################################################################
######################################################################################
hset instrument/doppler/ctrl/run_cmd 1
wait 10

set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999

histmem mode time
histmem preset 3600


###########################################################################################################
# acquisition 10 blocks of 1 hour at 263K


samplename QENS_C3H8_Xe_D2O_new_1K6K
for {set idx0 0} {$idx0 <6} {incr idx0} {
	broadcast loop $idx0 samplename QENS_C3H8_Xe_D2O_new_1K6
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}







































