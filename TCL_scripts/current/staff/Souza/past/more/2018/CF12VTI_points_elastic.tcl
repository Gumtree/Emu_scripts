 
histmem stop

#CF-12

hset /instrument/doppler/ctrl/run_cmd 0
wait 15
set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

samplename EW_el_5K
drive tc1_temp0_setpoint 5
wait 600
runscan dummy_motor 10 14 3 time 1800 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T  }

samplename EW_el_50K
drive tc1_temp0_setpoint 50
wait 600
runscan dummy_motor 10 14 3 time 1800 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T  }

samplename EW_el_100K
drive tc1_temp0_setpoint 100
wait 600
runscan dummy_motor 10 14 3 time 1800 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T  }

samplename EW_el_150K
drive tc1_temp0_setpoint 150
wait 600
runscan dummy_motor 10 14 3 time 1800 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T  }

samplename EW_el_200K
drive tc1_temp0_setpoint 200
wait 600
runscan dummy_motor 10 14 3 time 1800 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T  }

samplename EW_el_250K
drive tc1_temp0_setpoint 250
wait 600
runscan dummy_motor 10 14 3 time 1800 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T  }

samplename EW_el_295K
drive tc1_temp0_setpoint 295
wait 600
runscan dummy_motor 10 14 8 time 1800 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T  }
