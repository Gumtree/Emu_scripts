
histmem stop

#############################################################

#set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

#samplename S3_Li6PS5Br_500K
#runscan dummy_motor 10 14 4 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

#(<300K cool with VTI, set 5K below stick set point)
hset /sample/tc1/temp0/setpoint 175K 

hset /sample/tc2/temp6/setpoint 180K
samplename cool_D1_180K
runscan dummy_motor 10 14 84 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

