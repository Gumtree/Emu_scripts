 # Sample Environment: CF-12, cold stick 


# Doppler = 4.7 m/s
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999


# Direct neutrons & Analysed neutrons 3 time sets
# BKG mode; tAUX time channels [6.45 10.9 1 4.45 0 0] (set 0 analysed, set 1 direct, set 2 rest) (top to bottom)


# Chopper phase = -88 deg
# chom = 21.5 deg
# Chopper = BC = -2426 rpm
# background chopper = GC= 1213 rpm
##################################################################
##################################################################
histmem stop

#Doppler off
hset instrument/doppler/ctrl/run_cmd 0
wait 10

set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999
wait 10

#Initial measurement at given temperature
samplename EFW_vanadium_annular_22_1p7K
runscan dummy_motor 10 14 8 time 900 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

#Initial measurement at given temperature
samplename EFW_vanadium_annular_22_1p7K
runscan dummy_motor 10 14 8 time 900 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }


