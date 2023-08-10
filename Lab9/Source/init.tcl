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

set list []

for {set i 0} {$i < 1228799} {incr i 4} {
    if {$i <307199} {
        lappend list {0x00ff0000}
    } elseif {$i<614399} {
        lappend list {0x0000ff00}
    } elseif {$i <921599} {
        lappend list {0x000000ff}
    } else {
        lappend list {0x00ffff33}
    }
    
}
