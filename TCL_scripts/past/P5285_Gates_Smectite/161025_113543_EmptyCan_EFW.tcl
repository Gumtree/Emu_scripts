# Sample Environment: CF-3 
# Sample:Empty Can, 3mm gap, gas-loading

# Doppler = 0 m/s
# set_chopper_config_with_roi DopHz ChopHz frame=1 time-bins 16<VdetChannels<51 68<VdetHeightBins<200 0<DopTbins<399
# set_chopper_config_with_roi 0 40.42 1 600 16 50 68 200 0 599 

# Direct neutrons [9.9 12.3 0 0 0 0]
# Analysed neutrons [4 6.4 0 0 0 0]

# Chopper phase = -58 deg
# chom = 21.5 deg

# Temperature = 300K
# New radiation shield and temp sensor in place

histmem mode time

# Temp = 10K
drive tc1_driveable 10
wait 1200
# 15min scan
histmem preset 900
histmem start block
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
save
# 5min scan
histmem preset 600
histmem start block
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
save

# Temp = 230K
drive tc1_driveable 230
wait 1200
# 15min scan
histmem preset 900
histmem start block
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
save
# 5min scan
histmem preset 600
histmem start block
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
save

# Temp = 300K
drive tc1_driveable 300
wait 1200
# 15min scan
histmem preset 900
histmem start block
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
save
# 5min scan
histmem preset 600
histmem start block
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
save

