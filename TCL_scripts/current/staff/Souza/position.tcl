 
histmem stop

#Doppler drive control
hset /instrument/doppler/ctrl/profile_selector/settings/profile 2
wait 1
set_chopper_config_with_roi 0 20.21 1 1000 0 50 0 255 0 999

samplename Vcyl-30_el

hset /instrument/doppler/ctrl/profile_selector/settings/offset -75
wait 1
drive doppler_start 1
runscan dummy_motor 10 14 1 time 1200 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

hset /instrument/doppler/ctrl/profile_selector/settings/offset -62.5
wait 1
drive doppler_start 1
runscan dummy_motor 10 14 1 time 1200 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

hset /instrument/doppler/ctrl/profile_selector/settings/offset -50
wait 1
drive doppler_start 1
runscan dummy_motor 10 14 1 time 1200 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

hset /instrument/doppler/ctrl/profile_selector/settings/offset -37.5
wait 1
drive doppler_start 1
runscan dummy_motor 10 14 1 time 1200 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

hset /instrument/doppler/ctrl/profile_selector/settings/offset -25
wait 1
drive doppler_start 1
runscan dummy_motor 10 14 1 time 1200 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

hset /instrument/doppler/ctrl/profile_selector/settings/offset -12.5
wait 1
drive doppler_start 1
runscan dummy_motor 10 14 1 time 1200 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

hset /instrument/doppler/ctrl/profile_selector/settings/offset 0
wait 1
drive doppler_start 1
runscan dummy_motor 10 14 1 time 1200 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

hset /instrument/doppler/ctrl/profile_selector/settings/offset 12.5
wait 1
drive doppler_start 1
runscan dummy_motor 10 14 1 time 1200 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

hset /instrument/doppler/ctrl/profile_selector/settings/offset 25
wait 1
drive doppler_start 1
runscan dummy_motor 10 14 1 time 1200 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

hset /instrument/doppler/ctrl/profile_selector/settings/offset 37.5
wait 1
drive doppler_start 1
runscan dummy_motor 10 14 1 time 1200 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

hset /instrument/doppler/ctrl/profile_selector/settings/offset 50
wait 1
drive doppler_start 1
runscan dummy_motor 10 14 1 time 1200 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

hset /instrument/doppler/ctrl/profile_selector/settings/offset 62.5
wait 1
drive doppler_start 1
runscan dummy_motor 10 14 1 time 1200 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

hset /instrument/doppler/ctrl/profile_selector/settings/offset 75
wait 1
drive doppler_start 1
runscan dummy_motor 10 14 1 time 1200 datatype { TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX }

#tertiary close



