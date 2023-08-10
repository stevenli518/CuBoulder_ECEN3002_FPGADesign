 set master_path [lindex [get_service_paths master] 0]
 set mpath [claim_service master $master_path ""]
 set jpath [lindex [get_service_paths jtag_debug] 0]
 jtag_debug_reset_system $jpath
 puts "System reset......"
 set clk [jtag_debug_sense_clock $jpath]
 
 if {$clk == 1} {
    puts "Clocking running properly."
} else {
    "Clocking appears to not be running."
}

set rst [jtag_debug_sample_reset $jpath]
puts "Reset level is $rst"

#Create a list
set list []
#Set the list element from index 0 to 999 to 0xff
for {set i 0} {$i < 1000} {incr i} {
    lappend list {0xff}
}

#Write the list to memory
puts "Writing 0xff to first 1000 memory locations........."

master_write_memory $mpath 0x0 $list
puts "Writing finished"

#Read the value back 
puts "Read the value............"
set read_back [master_read_memory $mpath 0x0 1000]

#Compare
puts "Compare......"
for {set i 0} {$i < 1000} {incr i} {
    set data [lindex $read_back $i]
    puts $i
    if {$data == 0xff} {
    master_write_16 $mpath 0x10000000 0x0200
    } else {
    master_write_16 $mpath 0x10000000 0x0001
    }
}
puts "CLOSE Process"
close_service master $mpath
