histmem stop

# CF-12 H2 Mercury controller

#hset /instrument/doppler/ctrl/run_cmd 1
#wait 5
#set_chopper_config_with_roi 9.962 20.21 1 1000 0 50 0 255 0 999
#wait 5

# acquisition blocks of x/3600 hrs
set n_run 8
set run_time 3600
histmem mode time
histmem preset $run_time

samplename S33_1%hBC_20IL%dDMF_inel_330K

hset /sample/tc1/temp0/setpoint 313
drive tc2_temp0_setpoint 330
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:1.0
hset /sample/tc1/temp0/setpoint 319.5
wait 600
tc1_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF

for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}
