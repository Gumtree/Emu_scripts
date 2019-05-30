# Sample Environment: CF-12, gas loading stick (similar to cold stick)
# Sample: PAW1_28d (laurie)

# Doppler = 0 m/s (EFW)
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999

#Low Background Mode

# Chopper phase = -64 deg
# chom = 21.2 deg
# mom = 21.0 deg

histmem stop

hset instrument/doppler/ctrl/run_cmd 0
set_chopper_config_with_roi 0 20.21 1 1000 16 50 0 255 0 999


# For temperatures above 50K, activate control of tc2_temp6
hset /sample/tc2/temp6/auto 1

hset /sample/tc1/temp0/setpoint 95K
hset /sample/tc2/temp0/setpoint 105K
hset /sample/tc2/temp6/setpoint 100K
