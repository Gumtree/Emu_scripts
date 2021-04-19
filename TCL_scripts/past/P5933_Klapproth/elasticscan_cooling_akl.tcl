#taux: 6.45 10.9 1.0 4.45 0 0

histmem stop

#############################################################

#set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

#samplename el_D2O+CD4+C2H6_20_80_black_100K
#runscan dummy_motor 10 14 24 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

hset /sample/tc2/temp6/setpoint 1.61
samplename el_D2O+CD4+C2H6_20_80_black_100Kto1.6K
runscan dummy_motor 10 14 60 time 150 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T }

