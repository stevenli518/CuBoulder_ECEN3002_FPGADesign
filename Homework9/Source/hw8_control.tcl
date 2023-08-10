set master_path [lindex [get_service_paths master] 0]
set mpath [claim_service master $master_path ""]
set jpath [lindex [get_service_paths jtag_debug] 0]
#reset the system
jtag_debug_reset_system $jpath
set clk [jtag_debug_sense_clock $jpath]
set rst [jtag_debug_sample_reset $jpath]

#Control command
#1 Read SW value
master_read_16 $mpath 0x0 1
#2 Write to turn on LEDR[9]
master_write_8 $mpath 0x10 0x1
#3 Write to turn on LEDR[7:0]
master_write_8 $mpath 0x20 0xff
#Close Service
close_service master $mpath