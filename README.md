# Compiler_Validation
This repo contains RTL and their testbenches to validate RTL vs Netlist for compiler validation

## RTL Designs Netlist to Simulation Flow

### Running the Script to run a Design

Each testcase has its own script that can run the whole flow (Raptor compilation to VCS/Verilator simulation flow) Steps that are needed to be followed:

1. Open the terminal in the testcase directory where the bash script resides and source VCS or Verilator.
2. After that source Raptor.
3. To run the script, enter: `./raptor_run.sh`

There are three ways to execute the script:

1. If executed as it is without any parameter passed, the script will use paramters defined inside the script.
2. If executed as ```./raptor_run.sh load_toolconf"```, it will get four parameters(explained below) from tool.conf.
3. Last way is to pass four parameter through command line as ```./raptor_run.sh 23 90 false 1GE100``` Following are the parameter and there order in which passed, note that reg_id is constant set to 23 and should be passed as it is i.e. 23. (**reg_id timeout post_synth_sim device**)

### "tool.conf" parameters

This file has four parameters:

&nbsp;&nbsp;**reg_id**: Used only by CGA team **(not for user)**.   
&nbsp;&nbsp;**timeout**: This parameter is timeout set for design to exit out if time goes beyond the set limit in this parameter.   
&nbsp;&nbsp;**post_synth_sim**: This paramter can be either set true or false, depending on if yo0u want to run RTL vs post synthesis netlist simulation(in case co_sim testbench is present).   
&nbsp;&nbsp;**device**: This paramter sets the device (e.g GEMINI) on which tests need to run.

### "raptor_run.sh" parameters

Script has following parameters that can be edited in order to select post-synthesis simulation.
1. only_Raptor must be true to run Raptor.
2. For post-synthesis co-simulation make post_synth_sim as true
3. post-route simulatiion support yet to be added.
4. Some more option can also be set which are:
```
        #raptor options
        device="GEMINI"

        strategy="delay" #(area, delay, mixed, none) 

        add_constraint_file="./pin_mapping.pin" #Sets SDC + location constraints  Constraints: set_pin_loc, set_mode, all SDC Standard commands

        verific_parser="" #(on/off)

        synthesis_type="" #(Yosys/QL/RS)

        custom_synth_script="" #(Uses a custom Yosys templatized script)

        synth_options=""
                                #synth_options <option list>: RS-Yosys Plugin Options. The following defaults exist:
                                #                               :   -effort high
                                #                               :   -fsm_encoding binary if optimization == area else onehot
                                #                               :   -carry auto
                                #                               :   -clke_strategy early
                                #       -effort <level>          : Optimization effort level (high, medium, low)
                                #       -fsm_encoding <encoding> : FSM encoding:
                                #       binary                 : Compact encoding - using minimum of registers to cover the N states
                                #       onehot                 : One hot encoding - using N registers for N states
                                #       -carry <mode>            : Carry logic inference mode:
                                #       all                    : Infer as much as possible
                                #       auto                   : Infer carries based on internal heuristics
                                #       none                   : Do not infer carries
                                #       -no_dsp                  : Do not use DSP blocks to implement multipliers and associated logic
                                #       -no_bram                 : Do not use Block RAM to implement memory components
                                #       -fast                    : Perform the fastest synthesis. Don't expect good QoR.
                                #       -no_simplify             : Do not run special simplification algorithms in synthesis. 
                                #       -clke_strategy <strategy>: Clock enable extraction strategy for FFs:
                                #       early                  : Perform early extraction
                                #       late                   : Perform late extraction
                                #       -cec                     : Dump verilog after key phases and use internal equivalence checking (ABC based)

        pin_loc_assign_method=""  #pin_loc_assign_method <Method>: Method choices:
                                  #      in_define_order(Default), port order pin assignment
                                  #      random , random pin assignment
                                  #      free , no automatic pin assignment

        pnr_options=""  #VPR options
        pnr_netlist_lang="" #blif, edif, verilog
        set_channel_width="" #int
        architecture="" #<vpr_file.xml> ?<openfpga_file.xml>? : Uses the architecture file and optional openfpga arch file (For bitstream generation)
        set_device_size="" #XxY Device fabric size selection
        bitstream="" #force
```


## Random Design Generator
This repo contains the python script for random test generator, which can generate random designs providing the number of channels, depth and width to the script using the designs in the library/directory. These inputs are provided using json file.

Config files are created for every design, to get the top module name of each design. You can add number of channels, depth of channel, width and number of designs in this random_generator.json file. random_generator.json is available in the config folder.

To run this file you have to clone random testcase generator repo and run the command "python3 /home/users/zaheer.ahmad/Compiler_Validation/scripts/run_cv.py -T random_test_generator --json configs/test_generator.json" and script will create the verilog file for the designs and dump the output file in misc folder.

### Structure of the Repo

Random design generator contains following files

    Config file containing user input in *.json format.
    Design Library: contains list of dummy designs to test the flow
    cv_run.py script to control the compiler validation flow
    random_design_gen.py script to generate random rtl designs based on user input
    documentation folder which will contain all the documentation related to compiler validation flow

Random design generator creates misc folder where it dumps the output rtl file.

### test.config:

There are two flags in test.config of each testcase which differentiates the Functional regression and QoR regression. Details are as following:

reg_type=1   means QoR   
reg_type=2   means Functional Verification
stage_id=1   means yosys
stage_id=2   means VPR (fmax)
stage_id=3   means both yosys/VPR
stage_id=4   means Functional Verification

stage_id=1 means just synthesis, 4 mean Funtional Verification and else mean VPR
