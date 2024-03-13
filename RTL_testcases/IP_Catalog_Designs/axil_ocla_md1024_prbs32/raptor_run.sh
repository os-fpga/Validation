#!/bin/bash
set -e
main_path=$PWD
start=`date +%s`
 
 
#select tool (verilator, vcs, ghdl)
design="axil_ocla_md1024_prbs32"
    ip_name="axil_ocla"
tool_name="iverilog" 

#simulation stages
post_synth_sim=false 
post_route_sim=false 
bitstream_sim=false

#raptor options
device="GEMINI_COMPACT_104x68"

strategy="delay" #(area, delay, mixed, none) 

add_constraint_file="" #Sets SDC + location constraints  Constraints: set_pin_loc, set_mode, all SDC Standard commands

verific_parser="" #(on/off)

synthesis_type="" #(Yosys/QL/RS)

custom_synth_script="" #(Uses a custom Yosys templatized script)

synth_options="-new_tdp36k "
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

pin_loc_assign_method="free"  #pin_loc_assign_method <Method>: Method choices:
                          #      in_define_order(Default), port order pin assignment
                          #      random , random pin assignment
                          #      free , no automatic pin assignment

pnr_options=""  #VPR options
pnr_netlist_lang="" #blif, edif, verilog
set_channel_width="" #int
architecture="" #<vpr_file.xml> ?<openfpga_file.xml>? : Uses the architecture file and optional openfpga arch file (For bitstream generation)
set_device_size="" #XxY Device fabric size selection
bitstream=$( [ "$bitstream_sim" = "true" ] && echo "enable_simulation" || echo "" ) 

################################################################

function end_time(){
    end=`date +%s`
    runtime=$((end-start))
    echo -e "\nTotal RunTime to run raptor_run.sh: $runtime">>results.log
    echo "Peak Memory Usage: 117360">>results.log
    echo "ExecEndTime: $end">>results.log
    raptor --version>>results.log
}

function parse_cga(){
    cd $main_path
    tail -n100 ./results_dir/raptor.log > ./results_dir/raptor_tail.log
    timeout 15m python3 ../../../parser.py ./results_dir/results.log ./results_dir/raptor_perf.log
    mv CGA_Result.json ./results_dir
}

command -v raptor >/dev/null 2>&1 && raptor_path=$(which raptor) || { echo >&2 echo "First you need to source Raptor"; end_time
parse_cga exit; }
lib_fix_path="${raptor_path:(-11)}"
library=${raptor_path/$lib_fix_path//share/raptor/sim_models}

#removing and creating raptor_testcase_files
#rm -fR $PWD/results_dir
[ ! -d $PWD/results_dir ] && mkdir $PWD/results_dir
[ -d $PWD/results_dir ] && touch $PWD/results_dir/CGA_Result.json
cd $main_path
[ -f CGA_Result_default.json ] && cp CGA_Result_default.json ./results_dir/CGA_Result.json
[ -d $PWD/results_dir ] && cd $PWD/results_dir

echo "ExecStartTime: $start">results.log
echo "Domain of the design: Unit Level Test">>results.log
# Check if parameters were passed as command line arguments
reg_id="23"
timeout="90"
synth_stage=""
mute_flag=""
if [[ $# -eq 6 ]]; then
  reg_id=$1
  timeout=$2
  post_synth_sim=$3
  device=$4
  synth_stage=$5
  mute_flag=$6
else
  if [[ $1 == "load_toolconf" ]]; then
      # Load parameters from tool.conf file
      source $main_path/../../tool.conf
  elif [[ $1 == "clean" ]]; then
      cd $main_path
      PIDS=$(lsof +D "results_dir" | awk 'NR>1 {print $2}' | uniq)
      for PID in $PIDS; do
          if kill -0 $PID 2>/dev/null; then
              echo "Attempting to terminate process $PID..."
              kill $PID
              sleep 1
          if kill -0 $PID 2>/dev/null; then
              echo "Process $PID did not terminate gracefully. Forcing termination."
              kill -9 $PID 2>/dev/null || echo "Could not force terminate process $PID. It may have already exited."
          fi
          else
              echo "Process $PID already terminated."
          fi
      done
      rm -rf cksums.md5 newsum.md5 raptor_tcl.tcl results_dir/
      echo "Files cleaned"
      exit 0
    else
      echo "Using paramters defined in raptor_run.sh"
    fi
fi

if [ -z $1 ]; then
    echo "RegID: $reg_id">>results.log
else
    echo "RegID: $1">>results.log
fi

if [ -z $2 ]; then
    echo "timeout: $timeout">>results.log
else
    timeout=$2
    echo "timeout: $2">>results.log
fi

function compile () {
    [ -z "$ip_name" ] && temp=$(cd .. && pwd) || echo ""
    [ -z "$ip_name" ] && echo $temp || echo ""
    #finding the design
    [ -z "$ip_name" ] && echo "Current Design is $design" || echo ""
    [ -z "$ip_name" ] && design_path=`find $temp -type f -iname "$design.sv"` || echo ""
    if [ -z "$design_path" ]
    then
        [ -z "$ip_name" ] && echo "No such design $design" || echo ""
        # exit 1
    else 
        [ -z "$ip_name" ] && echo -e "$design Found!" || echo ""
    fi
    command -v raptor >/dev/null 2>&1 || { echo >&2 "Compilation requires Raptor but Raptor not installed."; end_time
parse_cga exit 1; }
#directory path where all the rtl design files are placed    
    [ -z "$ip_name" ] && directory_path=$(dirname $design_path) || echo ""

IP_PATH="./$design/run_1/IPs"
#creating a tcl file to run raptor flow 
    cd ..
    
    echo "create_design $design">raptor_tcl.tcl 
    echo "target_device $device">>raptor_tcl.tcl 

    ##vary design to design
    [ -z "$ip_name" ] && echo "" || echo  "configure_ip $ip_name"_v1_0" -mod_name $design -Pmem_depth=1024 -Pno_of_probes=32 -out_file $IP_PATH/$design">>raptor_tcl.tcl
    [ -z "$ip_name" ] && echo "" || echo "ipgenerate">>raptor_tcl.tcl

    [ -z "$ip_name" ] && echo "" || echo "add_include_path $IP_PATH/rapidsilicon/ip/$ip_name/v1_0/$design/src/">>raptor_tcl.tcl
    [ -z "$ip_name" ] && echo "" || echo "add_library_ext .v .sv">>raptor_tcl.tcl
    [ -z "$ip_name" ] && echo "" || echo "add_library_path $IP_PATH/rapidsilicon/ip/$ip_name/v1_0/$design/src/">>raptor_tcl.tcl
    [ -z "$ip_name" ] && echo "" || echo "add_design_file $IP_PATH/rapidsilicon/ip/$ip_name/v1_0/$design/src/$design\_v1_0.sv">>raptor_tcl.tcl

    [ -z "$ip_name" ] && echo "add_include_path ./rtl">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_library_path ./rtl">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_library_ext .v .sv">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/$design.sv">>raptor_tcl.tcl || echo "" 
    ##vary design to design

    echo "set_top_module $design">>raptor_tcl.tcl 

    ##vary design to design
    [ -z "$add_constraint_file" ] && echo "" || echo "add_constraint_file $add_constraint_file">>raptor_tcl.tcl 
    
    if [ "$post_synth_sim" == true ] || [ "$post_route_sim" == true ] || [ "$bitstream_sim" == true ]; then
        echo "add_simulation_file ./sim/co_sim_tb/co_sim_$design.v ./rtl/$design.v">>raptor_tcl.tcl 
        echo "set_top_testbench co_sim_$design">>raptor_tcl.tcl 
    else
        echo ""
    fi

	echo "analyze">>raptor_tcl.tcl
    [ -z "$verific_parser" ] && echo "" || echo "verific_parser $verific_parser">>raptor_tcl.tcl
    [ -z "$synthesis_type" ] && echo "" || echo "synthesis_type $synthesis_type">>raptor_tcl.tcl
    [ -z "$custom_synth_script" ] && echo "" || echo "custom_synth_script $custom_synth_script">>raptor_tcl.tcl
    [ -z "$synth_options" ] && echo "" || echo "synth_options $synth_options">>raptor_tcl.tcl
    [ -z "$strategy" ] && echo "" || echo "synthesize $strategy">>raptor_tcl.tcl  
    if [ "$post_synth_sim" == true ]; then 
        echo "# Open the input file in read mode">>raptor_tcl.tcl 
        echo "set input_file [open \"$design/run_1/synth_1_1/synthesis/$design\_post_synth.v\" r]">>raptor_tcl.tcl 
        echo "# Read the file content">>raptor_tcl.tcl 
        echo "set file_content [read \$input_file]">>raptor_tcl.tcl 
        echo "# Close the input file after reading">>raptor_tcl.tcl 
        echo "close \$input_file">>raptor_tcl.tcl 
        echo "set modified_content [string map {\"$design(\" \"${design}_post_synth(\"} \$file_content]">>raptor_tcl.tcl 
        echo "# Open the file again, this time in write mode to overwrite the old content">>raptor_tcl.tcl 
        echo "set output_file [open \"$design/run_1/synth_1_1/synthesis/$design\_post_synth.v\" w]">>raptor_tcl.tcl
        echo "# Write the modified content back to the file">>raptor_tcl.tcl 
        echo "puts \$output_file \$modified_content">>raptor_tcl.tcl 
        echo "# Close the file">>raptor_tcl.tcl 
        echo "close \$output_file">>raptor_tcl.tcl 
        echo "puts \"Modification completed.\"">>raptor_tcl.tcl 
        [ "$tool_name" = "iverilog" ] && echo "simulation_options compilation icarus gate" >> raptor_tcl.tcl || echo "simulation_options compilation verilator gate" >> raptor_tcl.tcl
        [ "$tool_name" = "iverilog" ] && echo "simulate gate icarus">>raptor_tcl.tcl || echo "simulate gate verilator">>raptor_tcl.tcl 
    else
        echo ""
    fi
    if [ "$synth_stage" == "1" ]; then 
		echo "" 
	else
    [ -z "$pin_loc_assign_method" ] && echo "" || echo "pin_loc_assign_method $pin_loc_assign_method">>raptor_tcl.tcl 
    [ -z "$pnr_options" ] && echo "" || echo "pnr_options $pnr_options">>raptor_tcl.tcl
    [ -z "$pnr_netlist_lang" ] && echo "" || echo "pnr_netlist_lang $pnr_netlist_lang">>raptor_tcl.tcl
    [ -z "$set_channel_width" ] && echo "" || echo "set_channel_width $set_channel_width">>raptor_tcl.tcl 
    [ -z "$architecture" ] && echo "" || echo "architecture $architecture">>raptor_tcl.tcl 
    [ -z "$set_device_size" ] && echo "" || echo "set_device_size $set_device_size">>raptor_tcl.tcl 
    echo "packing">>raptor_tcl.tcl  
    echo "place">>raptor_tcl.tcl  
    echo "route">>raptor_tcl.tcl  
        if [ "$post_route_sim" == true ]; then 
            echo "# Open the input file in read mode">>raptor_tcl.tcl 
            echo "set input_file [open \"$design/run_1/synth_1_1/synthesis/wrapper_$design\_post_synth.v\" r]">>raptor_tcl.tcl 
            echo "# Read the file content">>raptor_tcl.tcl 
            echo "set file_content [read \$input_file]">>raptor_tcl.tcl 
            echo "# Close the input file after reading">>raptor_tcl.tcl 
            echo "close \$input_file">>raptor_tcl.tcl 
            echo "set modified_content [string map {\"module $design(\" \"module ${design}_post_route (\"} \$file_content]">>raptor_tcl.tcl 
            echo "# Open the file again, this time in write mode to overwrite the old content">>raptor_tcl.tcl 
            echo "set output_file [open \"$design/run_1/synth_1_1/synthesis/wrapper_$design\_post_synth.v\" w]">>raptor_tcl.tcl
            echo "# Write the modified content back to the file">>raptor_tcl.tcl 
            echo "puts \$output_file \$modified_content">>raptor_tcl.tcl 
            echo "# Close the file">>raptor_tcl.tcl 
            echo "close \$output_file">>raptor_tcl.tcl 
            echo "puts \"Modification completed.\"">>raptor_tcl.tcl 
            # echo "exec python3 $main_path/../../../scripts/post_route_script.py $design">>raptor_tcl.tcl 
            [ "$tool_name" = "iverilog" ] && echo "simulation_options compilation icarus -DPNR=1 pnr" >> raptor_tcl.tcl || echo "simulation_options compilation verilator -DPNR=1 pnr" >> raptor_tcl.tcl
            [ "$tool_name" = "iverilog" ] && echo "simulate pnr icarus">>raptor_tcl.tcl || echo "simulate pnr verilator">>raptor_tcl.tcl 
        else
            echo ""
        fi
    echo "sta">>raptor_tcl.tcl  
    echo "power">>raptor_tcl.tcl  
    echo "bitstream $bitstream">>raptor_tcl.tcl  
        if [ "$bitstream_sim" == true ]; then 
            echo "clear_simulation_files">>raptor_tcl.tcl 
            echo "add_simulation_file testbench.sv">>raptor_tcl.tcl 
            echo "add_library_path ../../../../openfpga-pd-castor-rs/k6n8_TSMC16nm_7.5T/CommonFiles/task/CustomModules/">>raptor_tcl.tcl 
            echo "simulate "bitstream_bd" "icarus" ">>raptor_tcl.tcl 
        else
            echo ""
        fi
    fi

    cd results_dir
    echo "Device: $device">>results.log
    echo "Strategy: $strategy">>results.log

    timeout+='m'
    if [ -d ../rtl ]; then 
        rm -fr ../rtl/obj_dir ../rtl/*.vcd ../rtl/*.cpp ../rtl/simv.daidir ../rtl/csrc
        [ ! -f ../cksums.md5 ] && find ../rtl -type f -exec md5sum {} + > ../cksums.md5 
        find ../rtl -type f -exec md5sum {} + > ../newsum.md5
    else
        echo ""
    fi
    #running raptor flow script
    if cmp --silent -- "../cksums.md5" "../newsum.md5" && [ -d $design ]; then
        echo "Raptor was already compiled"  
    else 
        timeout $timeout raptor --batch $mute_flag --script ../raptor_tcl.tcl 2>&1 | tee -a results.log
        if [ ${PIPESTATUS[0]} -eq 124 ]; then
            echo -e "\nERROR: TIM: Design Compilation took $timeout. Exiting due to timeout">>raptor.log
            cat raptor.log >> results.log
            end_time
            parse_cga
            exit
        fi 
    fi 
    # [ -f ../newsum.md5 ] && cp ../newsum.md5 ../cksums.md5
  
}

compile 
cat raptor.log >> results.log
echo -e "\n\n#########Raptor Performance Data#########" >> results.log
cat raptor_perf.log >> results.log
echo -e "#############################################\n" >> results.log

[ -f $main_path/sim/co_sim_tb/co_sim_$design\_temp.v ] && mv $main_path/sim/co_sim_tb/co_sim_$design\_temp.v $main_path/sim/co_sim_tb/co_sim_$design.v || echo ""
end_time
parse_cga