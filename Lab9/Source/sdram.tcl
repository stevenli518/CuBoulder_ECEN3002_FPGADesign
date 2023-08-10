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

for {set i 0} {$i < 1228799} {incr i 4 } {
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

#Write the list to memory
master_write_32 $mpath 0x0 $list
puts "Writing finished"

#Clear Status Register
master_write_32 $mpath 0x04000000   0
#Read Start Address 
master_write_32 $mpath  0x04000004   0x0
#Write Start Address
master_write_32 $mpath 0x04000008   0x0
#Length 
master_write_32 $mpath 0x0400000c   1228800
#Control Register 
master_write_32 $mpath 0x04000018   0x294
#Set Go bit
master_write_32 $mpath 0x04000018   0x29c
set flag 1
while {$flag} {
set read [master_read_32 $mpath  0x04000000  1 ]
 set result [expr $read & 0x00000001]
    if {$result == 1} {
        master_write_32 $mpath 0x04000000   0
        master_write_32 $mpath 0x04000004   0x0
        master_write_32 $mpath 0x0400000c   1228800
        master_write_32 $mpath 0x04000018   0x29c
    } 

    

}




#puts "CLOSE Process"
#close_service master $mpath
