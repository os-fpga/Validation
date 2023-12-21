create_design uoft_raytracer
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/vidout.vhd
add_design_file ./rtl/vectsub.vhd
add_design_file ./rtl/vectexchange.vhd
add_design_file ./rtl/vectdelay.vhd
add_design_file ./rtl/complib.vhd
add_design_file ./rtl/vblockramcontroller.vhd
add_design_file ./rtl/uoft_raytracer.vhd
add_design_file ./rtl/top.vhd
add_design_file ./rtl/sramcontroller.vhd
add_design_file ./rtl/spramblock.vhd
add_design_file ./rtl/spram.vhd
add_design_file ./rtl/sortedstack.vhd
add_design_file ./rtl/shifter.vhd
add_design_file ./rtl/scanlinebuffer.vhd
add_design_file ./rtl/scanline.vhd
add_design_file ./rtl/rgsramcontroller.vhd
add_design_file ./rtl/rgconfigmemory.vhd
add_design_file ./rtl/resultwriter.vhd
add_design_file ./rtl/resulttransmit.vhd
add_design_file ./rtl/resultstate.vhd
add_design_file ./rtl/resultrecieve.vhd
add_design_file ./rtl/resultinterface.vhd
add_design_file ./rtl/resultcounter.vhd
add_design_file ./rtl/raytri.vhd
add_design_file ./rtl/raysend.vhd
add_design_file ./rtl/rayinterface.vhd
add_design_file ./rtl/raygentop.vhd
add_design_file ./rtl/raygencont.vhd
add_design_file ./rtl/raybuffer.vhd
add_design_file ./rtl/onlyonecycle.vhd
add_design_file ./rtl/nearcmpspec.vhd
add_design_file ./rtl/nearcmp.vhd
add_design_file ./rtl/memoryinterface.vhd
add_design_file ./rtl/matmult.vhd
add_design_file ./rtl/listhandler.vhd
add_design_file ./rtl/listbuffer.vhd
add_design_file ./rtl/linearmap.vhd
add_design_file ./rtl/framebuftop.vhd
add_design_file ./rtl/fifo3.vhd
add_design_file ./rtl/exchange.vhd
add_design_file ./rtl/dpram.vhd
add_design_file ./rtl/dotproduct.vhd
add_design_file ./rtl/divide.vhd
add_design_file ./rtl/delay.vhd
add_design_file ./rtl/crossproduct.vhd
add_design_file ./rtl/col16to21.vhd
add_design_file ./rtl/boundtop.vhd
add_design_file ./rtl/boundcontroller.vhd
add_design_file ./rtl/bilinearintrp.vhd
set_top_module uoft_raytracer
synthesize delay
pin_loc_assign_method free
packing
global_placement
place
route
sta
power
bitstream 
