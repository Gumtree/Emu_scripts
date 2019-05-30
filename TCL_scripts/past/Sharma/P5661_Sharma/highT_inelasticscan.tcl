# Sample Environment: CF-12 H2 exchange gas
# Sample:nasicon_parent_inelastic

# Doppler = 4.7 m/s
# set_chopper_config_with_roi 9.962 20.21 1 1000 16 50 0 255 0 999
# low background mode 

# acquisition blocks of 1 hrs

#change sample temperature to 400K
#drive tc2_temp0_setpoint 400

#needle valve to 20mbar
#drive tc1_pres3_setpoint 20

#drive VTI to 290K
#drive tc1_temp0_setpoint 290

#ONCE PUCK steady under exchange gas evacuate sample chamber
#ONCE PUCK STEADY UNDER VACUM OR OK FROM LOCAL CONTACT START SCRIPT

set n_run 11
set run_time 3600
histmem mode time
histmem preset $run_time

tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:ON
tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:5.0
drive tc2_temp0_setpoint 540

tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RSET:1.0
drive tc2_temp0_setpoint 550
tc2_queue send SET:DEV:MB1.T1:TEMP:LOOP:RENA:OFF

wait 900
samplename nasicon_parent_inel_550K
for {set idx0 0} {$idx0 < $n_run} {incr idx0} {
	broadcast data_set $idx0 
	histmem start block
	newfile TOTAL_HISTOGRAM_XT TOTAL_HISTOGRAM_T RAW_TOTAL_HISTOGRAM_XTAUX RAW_TOTAL_HISTOGRAM_YTAUX
	save 
}




drive tc2_temp0_setpoint 300

