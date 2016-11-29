# Test script 

histmem mode time
histmem preset 30
newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX


# Wait 10s
wait 10
# Measure 1 x 5min
histmem start block
save

# Wait 20s
wait 20
# Measure 1 x 5min
histmem start block
save
