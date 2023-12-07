create_design test
architecture k6_frac_N10_tileable_40nm.xml k6_N10_40nm_openfpga.xml
set_macro P1=10  P2=20
add_include_path ./inc/
add_design_file rtl/test.sv rtl/bottom.sv -SV_2012
set_top_module top
analyze
synthesize delay
packing
place
route
sta
