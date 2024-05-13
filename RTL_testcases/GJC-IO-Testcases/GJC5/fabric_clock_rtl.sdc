set_top_module GJC5
# Timing constraints
create_clock -name CLK -period 5 
create_generated_clock -source [get_clocks CLK] -divide_by 2 [get_nets half_clk]
set_input_delay -clock CLK -max 3 [get_ports D_full_speed]
set_input_delay -clock CLK -min 1 [get_ports D_full_speed]
set_input_delay -clock half_clk -max 3 [get_ports D_half_speed]
set_input_delay -clock half_clk -min 1 [get_ports D_half_speed]
set_output_delay -clock CLK -max 2.5 [get_ports Q_full_speed]
set_output_delay -clock CLK -min 0.5 [get_ports Q_full_speed]
set_output_delay -clock half_clk -max 2.5 [get_ports Q_half_speed]
set_output_delay -clock half_clk -min 0.5 [get_ports Q_half_speed]


# Location Constraints (May not be provided early in design cycle)
set_property PIN_LOC AH26 [get_ports D_full_speed]   # D_full_speed pin constrained to pin AH26
set_property PIN_LOC AH28 [get_ports D_half_speed]   # D_half_speed pin constrained to pin AH28
set_property PIN_LOC AG21 [get_ports CLK] # CLK pin constrained to clock-capable pin AG21
set_property PIN_LOC AA17 [get_ports Q_full_speed]   # Q_full_speed pin constrained to pin AA17
set_property PIN_LOC AA19 [get_ports Q_half_speed]   # Q_half_speed pin constrained to pin AA19

# Specify I/O Standard (If not specified, use default)
set_property IOSTANDARD LVCMOS_18_HR [get_ports D_full_speed]
set_property IOSTANDARD LVCMOS_18_HR [get_ports D_half_speed]
set_property IOSTANDARD LVCMOS_18_HR [get_ports CLK]
set_property IOSTANDARD LVCMOS_18_HR [get_ports Q_full_speed]
set_property IOSTANDARD LVCMOS_18_HR [get_ports Q_half_speed]

# Specify DRIVE_STRENGTH and SLEW_RATE for LVCMOS Output (If not specified, use default)
set_property DRIVE_STRENGTH 12 [get_ports Q_full_speed]  # Values are: 2,4,6,8,12,16 
set_property SLEW_RATE SLOW [get_ports Q_full_speed]   # Values are: SLOW,FAST
set_property DRIVE_STRENGTH 12 [get_ports Q_half_speed]  # Values are: 2,4,6,8,12,16 
set_property SLEW_RATE SLOW [get_ports Q_half_speed]   # Values are: SLOW,FAST

# Push Register into I/O (If not specified, place register in FLE)
set_property IO_REG TRUE [get_ports Q_full_speed]