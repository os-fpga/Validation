create_design canny_edge_detector_02_24
target_device 1GE100
add_design_file ./rtl/ninerowsbuffer.vhd
add_design_file ./rtl/krnl2.vhd
add_design_file ./rtl/kernel.vhd
add_design_file ./rtl/filterV.vhd
add_design_file ./rtl/FIFOLineBuffer.vhd
add_design_file ./rtl/DoubleLineBuffer.vhd
add_design_file ./rtl/CacheSystem3.vhd
add_design_file ./rtl/CacheSystem2.vhd
add_design_file ./rtl/buffer.vhd
add_design_file ./rtl/wrapper.vhd
add_design_file ./rtl/canny_edge_detection_top.vhd

set_top_module canny_edge_detection_top
synthesize delay
packing
place
route
sta
power
bitstream
