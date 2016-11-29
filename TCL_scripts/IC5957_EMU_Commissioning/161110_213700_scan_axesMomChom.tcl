#histmem mode time
#histmem preset 500

#histmem start block
#newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
#save


#in proper loop form (Oct 2016):
for {set i 18.0} {$i <= 24.0} {set i [expr $i + 0.25]} {
drive mom $i
runscan chom 18.75 22.25 15 time 350 datatype TOTAL_HISTOGRAM_XT 
}


# initial iterations duplicate the following instead
#drive mom 18.25
#runscan chom 18.75 22.25 15 time 300 datatype TOTAL_HISTOGRAM_XT 




