# Sample Environment: CF-10 
# Sample:m-xylene 0.2mm

# Doppler = 4.7 m/s

histmem mode time
histmem preset 7200

# acquisition 8 blocks of 2 hrs

samplename m-xylene-1.6K

for {set idx0 0} {$idx0 < 8} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}

