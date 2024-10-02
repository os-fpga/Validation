#!/bin/bash

ROOT_PATH=$(git rev-parse --show-toplevel)
source $ROOT_PATH/scripts/export_raptor_path.sh

set -e
main_path=$PWD
start=`date +%s`
 
 
design="directrf"
ip_name="" #design_level
#select tool (verilator, vcs, ghdl, iverilog)
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
bitstream=$( [ "$bitstream_sim" = "true" ] && echo "enable_simulation" || echo "" ) 

################################################################



# Update the script to modify existing Raptor synthesis options
source $ROOT_PATH/scripts/update_raptor_options.sh

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
[ -f ../../../scripts/CGA_Result_default.json ] && cp ../../../scripts/CGA_Result_default.json ./results_dir/CGA_Result.json
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
    [ -z "$ip_name" ] && design_path=`find $temp -type f -iname "$design.vhd"` || echo ""
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

#creating a tcl file to run raptor flow 
    cd ..
    
    echo "create_design $design">raptor_tcl.tcl 
    echo "target_device 1VG28">>raptor_tcl.tcl 

    ##vary design to design
    [ -z "$ip_name" ] && echo "" || echo "configure_ip $ip_name"_v1_0" -mod_name=$design -Pdata_width=32 -Paddr_width=16 -Pid_width=32 -Pa_pip_out=0 -Pb_pip_out=0 -Pa_interleave=0 -Pb_interleave=0 -out_file ./$design.v">>raptor_tcl.tcl
    [ -z "$ip_name" ] && echo "" || echo "ipgenerate">>raptor_tcl.tcl

    [ -z "$ip_name" ] && echo "" || echo "add_include_path ./rapidsilicon/ip/$ip_name/v1_0/$design/src/">>raptor_tcl.tcl
    [ -z "$ip_name" ] && echo "" || echo "add_library_ext .v .sv">>raptor_tcl.tcl
    [ -z "$ip_name" ] && echo "" || echo "add_library_path rapidsilicon/ip/$ip_name/v1_0/$design/src/">>raptor_tcl.tcl
    [ -z "$ip_name" ] && echo "" || echo "add_design_file ./rapidsilicon/ip/$ip_name/v1_0/$design/src/$design.v">>raptor_tcl.tcl

    [ -z "$ip_name" ] && echo "add_include_path ./rtl">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_library_path ./rtl">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_library_ext .v .sv">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DirectRFTest_and_DPD_SV_safe_path.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DirectRFTest_and_DPD_SV_DirectRFDesign.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DPD_Stage/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DPD_Stage/Forward_path/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Forward_path.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DPD_Stage/Forward_path1/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Forward_path1.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DPD_Stage/Forward_path2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Forward_path2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DPD_Stage/Forward_path3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Forward_path3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DPD_Stage/Forward_path4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Forward_path4.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DPD_Stage/Forward_path5/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Forward_path5.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DPD_Stage/c/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_c.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DPD_Stage/c1/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_c1.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DPD_Stage1/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DPD_Stage1/Forward_path/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DPD_Stage1/Forward_path1/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DPD_Stage1/Forward_path2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DPD_Stage1/Forward_path3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DPD_Stage1/Forward_path4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DPD_Stage1/Forward_path5/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DPD_Stage1/c/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DPD_Stage1/c1/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c1.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/BandSummer1/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_BandSummer1.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/CarrierSumI3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_CarrierSumI3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/CarrierSumQ3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_CarrierSumQ3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/CarrierSumScale3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_CarrierSumScale3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/FIR17/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_FIR17.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/FIR18/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_FIR18.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/FIR19/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_FIR19.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/FIR20/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_FIR20.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/FIR21/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_FIR21.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/FIR22/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_FIR22.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/FIR23/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_FIR23.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/FIR24/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_FIR24.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/FIR2Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_FIR2Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/FIR3Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_FIR3Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/FIR4Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_FIR4Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/FIR5Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_FIR5Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/FIR6Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_FIR6Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/FIR7Scale1/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_FIR7Scale1.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/FIR7Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_FIR7Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/FIR7Scale3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_FIR7Scale3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/FIR8Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_FIR8Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/FIR9Scale3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_FIR9Scale3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/FIR9Scale4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_FIR9Scale4.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/FIR9a1/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_FIR9a1.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/Interleaver3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Interleaver3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/Mixer10/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Mixer10.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/Mixer11/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Mixer11.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/Mixer12/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Mixer12.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/Mixer8/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Mixer8.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/Mixer9/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Mixer9.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/NCO_FDD3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_NCO_FDD3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/RF_carrier3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_RF_carrier3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_RF_carrier4.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/RF_phase2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_RF_phase2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/RF_phase3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_RF_phase3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/RF_sync3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_RF_sync3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/RF_sync4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_RF_sync4.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC1/latch_1L/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_latch_1L.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/BandSummer1/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/CarrierSumI3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/CarrierSumQ3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/CarrierSumScale3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/FIR17/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/FIR18/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/FIR19/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/FIR20/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/FIR21/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/FIR22/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/FIR23/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/FIR24/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/FIR2Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/FIR3Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/FIR4Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/FIR5Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/FIR6Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/FIR7Scale1/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/FIR7Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/FIR7Scale3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/FIR8Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/FIR9Scale3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/FIR9Scale4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/FIR9a1/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/Interleaver3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/Mixer10/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/Mixer11/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/Mixer12/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/Mixer8/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/Mixer9/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/NCO_FDD3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/RF_carrier3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/RF_phase2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/RF_phase3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/RF_sync3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/RF_sync4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC2/latch_1L/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_latch_1L.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/BandSummer1/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_BandSummer1.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/CarrierSumI3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_CarrierSumI3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/CarrierSumQ3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_CarrierSumQ3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/CarrierSumScale3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_CarrierSumScale3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/FIR17/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_FIR17.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/FIR18/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_FIR18.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/FIR19/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_FIR19.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/FIR20/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_FIR20.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/FIR21/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_FIR21.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/FIR22/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_FIR22.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/FIR23/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_FIR23.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/FIR24/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_FIR24.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/FIR2Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_FIR2Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/FIR3Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_FIR3Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/FIR4Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_FIR4Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/FIR5Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_FIR5Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/FIR6Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_FIR6Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/FIR7Scale1/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_FIR7Scale1.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/FIR7Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_FIR7Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/FIR7Scale3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_FIR7Scale3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/FIR8Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_FIR8Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/FIR9Scale3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_FIR9Scale3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/FIR9Scale4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_FIR9Scale4.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/FIR9a1/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_FIR9a1.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/Interleaver3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Interleaver3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/Mixer10/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Mixer10.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/Mixer11/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Mixer11.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/Mixer12/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Mixer12.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/Mixer8/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Mixer8.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/Mixer9/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Mixer9.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/NCO_FDD3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_NCO_FDD3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/RF_carrier3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_RF_carrier3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_RF_carrier4.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/RF_phase2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_RF_phase2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/RF_phase3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_RF_phase3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/RF_sync3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_RF_sync3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/RF_sync4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_RF_sync4.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC3/latch_1L/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_latch_1L.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/BandSummer1/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_BandSummer1.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/CarrierSumI3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_CarrierSumI3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/CarrierSumQ3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_CarrierSumQ3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/CarrierSumScale3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_CarrierSumScale3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/FIR17/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_FIR17.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/FIR18/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_FIR18.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/FIR19/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_FIR19.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/FIR20/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_FIR20.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/FIR21/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_FIR21.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/FIR22/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_FIR22.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/FIR23/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_FIR23.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/FIR24/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_FIR24.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/FIR2Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_FIR2Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/FIR3Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_FIR3Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/FIR4Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_FIR4Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/FIR5Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_FIR5Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/FIR6Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_FIR6Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/FIR7Scale1/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_FIR7Scale1.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/FIR7Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_FIR7Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/FIR7Scale3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_FIR7Scale3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/FIR8Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_FIR8Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/FIR9Scale3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_FIR9Scale3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/FIR9Scale4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_FIR9Scale4.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/FIR9a1/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_FIR9a1.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/Interleaver3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Interleaver3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/Mixer10/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Mixer10.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/Mixer11/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Mixer11.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/Mixer12/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Mixer12.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/Mixer8/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Mixer8.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/Mixer9/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Mixer9.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/NCO_FDD3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_NCO_FDD3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/RF_carrier3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_RF_carrier3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_RF_carrier4.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/RF_phase2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_RF_phase2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/RF_phase3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_RF_phase3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/RF_sync3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_RF_sync3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/RF_sync4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_RF_sync4.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC4/latch_1L/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_latch_1L.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/BandSummer1/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_BandSummer1.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/CarrierSumI3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_CarrierSumI3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/CarrierSumQ3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_CarrierSumQ3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/CarrierSumScale3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_CarrierSumScale3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/FIR17/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_FIR17.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/FIR18/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_FIR18.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/FIR19/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_FIR19.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/FIR20/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_FIR20.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/FIR21/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_FIR21.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/FIR22/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_FIR22.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/FIR23/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_FIR23.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/FIR24/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_FIR24.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/FIR2Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_FIR2Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/FIR3Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_FIR3Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/FIR4Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_FIR4Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/FIR5Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_FIR5Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/FIR6Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_FIR6Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/FIR7Scale1/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_FIR7Scale1.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/FIR7Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_FIR7Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/FIR7Scale3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_FIR7Scale3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/FIR8Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_FIR8Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/FIR9Scale3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_FIR9Scale3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/FIR9Scale4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_FIR9Scale4.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/FIR9a1/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_FIR9a1.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/Interleaver3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Interleaver3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/Mixer10/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Mixer10.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/Mixer11/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Mixer11.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/Mixer12/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Mixer12.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/Mixer8/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Mixer8.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/Mixer9/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Mixer9.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/NCO_FDD3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_NCO_FDD3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_phase2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_phase2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_phase3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_phase3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_sync3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_sync3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_sync4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_sync4.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/latch_1L/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_latch_1L.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/BandSummer1/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_BandSummer1.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/CarrierSumI3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_CarrierSumI3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/CarrierSumQ3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_CarrierSumQ3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/CarrierSumScale3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_CarrierSumScale3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/FIR17/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_FIR17.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/FIR18/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_FIR18.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/FIR19/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_FIR19.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/FIR20/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_FIR20.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/FIR21/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_FIR21.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/FIR22/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_FIR22.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/FIR23/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_FIR23.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/FIR24/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_FIR24.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/FIR2Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_FIR2Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/FIR3Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_FIR3Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/FIR4Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_FIR4Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/FIR5Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_FIR5Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/FIR6Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_FIR6Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/FIR7Scale1/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_FIR7Scale1.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/FIR7Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_FIR7Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/FIR7Scale3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_FIR7Scale3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/FIR8Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_FIR8Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/FIR9Scale3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_FIR9Scale3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/FIR9Scale4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_FIR9Scale4.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/FIR9a1/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_FIR9a1.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/Interleaver3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Interleaver3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/Mixer10/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Mixer10.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/Mixer11/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Mixer11.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/Mixer12/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Mixer12.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/Mixer8/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Mixer8.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/Mixer9/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Mixer9.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/NCO_FDD3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_NCO_FDD3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/RF_carrier3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_RF_carrier3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_RF_carrier4.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/RF_phase2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_RF_phase2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/RF_phase3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_RF_phase3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/RF_sync3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_RF_sync3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/RF_sync4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_RF_sync4.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC6/latch_1L/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_latch_1L.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/BandSummer1/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_BandSummer1.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/CarrierSumI3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_CarrierSumI3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/CarrierSumQ3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_CarrierSumQ3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/CarrierSumScale3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_CarrierSumScale3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/FIR17/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_FIR17.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/FIR18/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_FIR18.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/FIR19/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_FIR19.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/FIR20/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_FIR20.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/FIR21/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_FIR21.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/FIR22/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_FIR22.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/FIR23/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_FIR23.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/FIR24/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_FIR24.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/FIR2Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_FIR2Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/FIR3Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_FIR3Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/FIR4Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_FIR4Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/FIR5Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_FIR5Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/FIR6Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_FIR6Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/FIR7Scale1/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_FIR7Scale1.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/FIR7Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_FIR7Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/FIR7Scale3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_FIR7Scale3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/FIR8Scale2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_FIR8Scale2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/FIR9Scale3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_FIR9Scale3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/FIR9Scale4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_FIR9Scale4.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/FIR9a1/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_FIR9a1.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/Interleaver3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Interleaver3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/Mixer10/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Mixer10.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/Mixer11/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Mixer11.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/Mixer12/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Mixer12.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/Mixer8/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Mixer8.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/Mixer9/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Mixer9.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/NCO_FDD3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_NCO_FDD3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/RF_carrier3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_RF_carrier3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_RF_carrier4.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/RF_phase2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_RF_phase2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/RF_phase3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_RF_phase3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/RF_sync3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_RF_sync3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/RF_sync4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_RF_sync4.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC7/latch_1L/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_latch_1L.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/MixerScaleI1/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/MixerScaleI2/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/MixerScaleI3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/dspbaChanOut0/DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut0.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/dspbaChanOut1/DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut1.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/dspbaChanOut10/DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut10.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/dspbaChanOut11/DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut11.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/dspbaChanOut12/DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut12.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/dspbaChanOut13/DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut13.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/dspbaChanOut14/DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut14.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/dspbaChanOut15/DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut15.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/dspbaChanOut16/DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut16.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/dspbaChanOut2/DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut2.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/dspbaChanOut3/DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut3.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/dspbaChanOut4/DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut4.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/dspbaChanOut5/DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut5.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/dspbaChanOut6/DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut6.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/dspbaChanOut7/DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut7.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/dspbaChanOut8/DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut8.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/dspbaChanOut9/DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut9.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/dspbaChannel/DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChannel.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/dspbaData/DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaData.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/dspbaValid/DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaValid.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/DirectRFTest_and_DPD_SV/DirectRFDesign/valid_out/DirectRFTest_and_DPD_SV_DirectRFDesign_valid_out.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/dspba_library_package.vhd">>raptor_tcl.tcl || echo ""
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/dspba_library.vhd">>raptor_tcl.tcl || echo ""
    ##vary design to design

    echo "set_top_module DirectRFTest_and_DPD_SV_DirectRFDesign">>raptor_tcl.tcl 

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
            echo "set input_file [open \"$design/run_1/synth_1_1/synthesis/post_pnr_wrapper_$design\_post_synth.v\" r]">>raptor_tcl.tcl 
            echo "# Read the file content">>raptor_tcl.tcl 
            echo "set file_content [read \$input_file]">>raptor_tcl.tcl 
            echo "# Close the input file after reading">>raptor_tcl.tcl 
            echo "close \$input_file">>raptor_tcl.tcl 
            echo "set modified_content [string map {\"module $design(\" \"module ${design}_post_route (\"} \$file_content]">>raptor_tcl.tcl 
            echo "# Open the file again, this time in write mode to overwrite the old content">>raptor_tcl.tcl 
            echo "set output_file [open \"$design/run_1/synth_1_1/synthesis/post_pnr_wrapper_$design\_post_synth.v\" w]">>raptor_tcl.tcl
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
    [ -f ../newsum.md5 ] && cp ../newsum.md5 ../cksums.md5
  
}

compile 
cat raptor.log >> results.log
echo -e "\n\n#########Raptor Performance Data#########" >> results.log
cat raptor_perf.log >> results.log
echo -e "#############################################\n" >> results.log

[ -f $main_path/sim/co_sim_tb/co_sim_$design\_temp.v ] && mv $main_path/sim/co_sim_tb/co_sim_$design\_temp.v $main_path/sim/co_sim_tb/co_sim_$design.v || echo ""
end_time
parse_cga