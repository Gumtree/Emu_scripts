
# fait : typo means too long wait time. interrupted and switch to cooling
#wait 90
#drive tc1_driveable 300
#
#wait 900000

#wait 90
hset /sample/tc1/sensor/setpoint1 1

wait 130000

#wait 90
hset /sample/tc1/sensor/setpoint1 300