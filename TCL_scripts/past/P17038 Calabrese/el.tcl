 
histmem stop

#Doppler drive control
hset /instrument/doppler/ctrl/run_cmd 0
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999

samplename dP407-H2O-20p-PM-ourmagsetup-295K-45deg_el

drive msom 45
drive tc3_driveable 295

runscan dummy_motor 10 14 1 time 900 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }


#tertiary close



