cd \ECEN3002
cd Homework7
cd Quartus
project_open Homework7
set usb [lindex [get_hardware_names] 0]
set device_name [lindex [get_device_names -hardware_name $sub] 1]
read_content_from_memory -instance_index 0 -start_address 0 -word_count 10 -content_in_hex