# This file should be in your source directory
# Instance 0 is the pushbutton ISSP, instance 1 is the SW ISSP.

# Uncomment lines 6-8 to automatically program your board (Windows PC)
# You smust program your board once using the Quartus programmer to create the .cdf file
 puts "Programming board........"
	cd .. 
	pwd
   qexec "quartus_pgm.exe Quartus/Lab2.cdf" 
 puts "Programming complete."

puts "\nOpen project."

project_open Quartus/Lab2

# initialize_connections, this will return DE-SoC [USB-1]
set cable [lindex [get_hardware_names] 0]
puts "\nThe Bitblaster cable name is $cable."

# this will return the FPGA device
# returns @2: 5CS3BA6(.|ES)/5CSEMA6/.. (ox02D020DD)
set device_name [lindex [get_device_names -hardware_name $cable] 1]
puts "\nThe FPGA fabric containing the ISSP blocks is called $device_name."

#  Connect to the ISSP cores
start_insystem_source_probe -device_name $device_name -hardware_name $cable

#------------ Add your control code here -------------------------
puts "Counter in reset for 5 seconds"
write_source_data -instance_index 0 -value 110
after 5000

puts "Counter increment for 5 seconds"
write_source_data -instance_index 0 -value 111
after 5000

puts "Change Counter direction and let run for 5 seconds"
write_source_data -instance_index 0 -value 011
after 5000

puts "Load the SW value for 5 seconds"
write_source_data -instance_index 0 -value 101
after 5000

puts "Reset the counter"
write_source_data -instance_index 0 -value 110

# Test complete
puts "\nTest complete."
end_insystem_source_probe
project_close

# Set working directory back to source
cd ../source

