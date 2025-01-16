# Sample Environment: CF-10 
# Sample: empty container 1.6K

# Doppler = 4.7 m/s

histmem mode time
histmem preset 3600

# acquisition 12 blocks of 1 hrs

samplename emptycontainer_cooling

for {set idx0 0} {$idx0 < 12} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

