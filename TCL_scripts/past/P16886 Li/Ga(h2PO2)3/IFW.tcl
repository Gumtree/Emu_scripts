histmem stop

samplename Fomblin-300K-He_IFW

doppler ctrl/profile_selector/settings/profile 1
doppler ctrl/profile_selector/settings/amplitude 75
doppler ctrl/profile_selector/settings/velocity 1.52
drive doppler_start 1

set_chopper_config_with_roi 4.710 20.21 1 1000 0 50 0 255 0 999

runscan dummy_motor 10 14 1 time 1200 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }


doppler ctrl/run_cmd 0
newfile clear
histmem stop
