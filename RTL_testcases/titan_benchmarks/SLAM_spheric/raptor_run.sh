#!/bin/bash

ROOT_PATH=$(git rev-parse --show-toplevel)
set -e
main_path=$PWD
start=`date +%s`
 
 
design="SLAM_spheric"
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
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/ieee_FP_pkg/aesl_fp_wrapper.vhd">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/ieee_FP_pkg/fixed_float_types_c.vhd">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/ieee_FP_pkg/fixed_pkg_c.vhd">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/ieee_FP_pkg/float_pkg_c.vhd">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/AESL_FPSim_pkg.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_107_ACMP_faddfsub_1.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_113_ACMP_faddfsub_2.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_119_ACMP_faddfsub_3.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_128_ACMP_faddfsub_4.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_133_ACMP_faddfsub_5.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_137_ACMP_fadd_6.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_141_ACMP_faddfsub_7.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_145_ACMP_fadd_8.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_149_ACMP_faddfsub_9.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_153_ACMP_fadd_10.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_157_ACMP_fadd_11.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_161_ACMP_fadd_12.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_165_ACMP_faddfsub_13.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_169_ACMP_fadd_14.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_173_ACMP_fadd_15.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_177_ACMP_fadd_16.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_181_ACMP_fadd_17.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_185_ACMP_faddfsub_18.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_189_ACMP_fadd_19.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_193_ACMP_fsub_20.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_197_ACMP_fadd_21.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_208_ACMP_fmul_22.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_214_ACMP_fmul_23.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_226_ACMP_fmul_24.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_231_ACMP_fmul_25.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_235_ACMP_fmul_26.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_240_ACMP_fmul_27.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_244_ACMP_fmul_28.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_248_ACMP_fmul_29.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_252_ACMP_fmul_30.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_256_ACMP_fmul_31.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_260_ACMP_fmul_32.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_264_ACMP_fmul_33.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_268_ACMP_fmul_34.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_272_ACMP_fmul_35.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_276_ACMP_fmul_36.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_280_ACMP_fmul_37.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_284_ACMP_fmul_38.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_288_ACMP_fmul_39.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_292_ACMP_fmul_40.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_296_ACMP_fmul_41.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_300_ACMP_fmul_42.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_304_ACMP_fmul_43.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_308_ACMP_fmul_44.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_312_ACMP_fmul_45.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_317_ACMP_fmul_46.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_321_ACMP_fmul_47.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_325_ACMP_fmul_48.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_329_ACMP_fmul_49.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_333_ACMP_fmul_50.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_337_ACMP_fmul_51.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_341_ACMP_fmul_52.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_345_ACMP_fmul_53.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_349_ACMP_fmul_54.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/inverseComposePoint_grp_fu_353_ACMP_fmul_55.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_457_ACMP_faddfsub_66.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_464_ACMP_fadd_67.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_468_ACMP_fadd_68.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_472_ACMP_fadd_69.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_476_ACMP_fadd_70.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_480_ACMP_fadd_71.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_484_ACMP_fadd_72.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_488_ACMP_fadd_73.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_492_ACMP_fadd_74.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_496_ACMP_fadd_75.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_500_ACMP_fadd_76.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_504_ACMP_fadd_77.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_508_ACMP_fadd_78.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_512_ACMP_fadd_79.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_516_ACMP_fadd_80.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_520_ACMP_fadd_81.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_524_ACMP_fadd_82.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_528_ACMP_fadd_83.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_532_ACMP_fadd_84.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_536_ACMP_fadd_85.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_540_ACMP_fmul_86.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_544_ACMP_fmul_87.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_549_ACMP_fmul_88.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_553_ACMP_fmul_89.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_557_ACMP_fmul_90.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_561_ACMP_fmul_91.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_565_ACMP_fmul_92.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_569_ACMP_fmul_93.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_573_ACMP_fmul_94.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_577_ACMP_fmul_95.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_581_ACMP_fmul_96.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_585_ACMP_fmul_97.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_589_ACMP_fmul_98.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_593_ACMP_fmul_99.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_597_ACMP_fmul_100.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_601_ACMP_fmul_101.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_605_ACMP_fmul_102.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_609_ACMP_fmul_103.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_613_ACMP_fmul_104.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_617_ACMP_fmul_105.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_621_ACMP_fmul_106.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_625_ACMP_fmul_107.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_629_ACMP_fmul_108.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_633_ACMP_fmul_109.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_637_ACMP_fmul_110.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_641_ACMP_fmul_111.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_645_ACMP_fmul_112.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_649_ACMP_fmul_113.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_653_ACMP_fmul_114.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_657_ACMP_fmul_115.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_661_ACMP_fmul_116.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_665_ACMP_fmul_117.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_669_ACMP_fmul_118.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_673_ACMP_fmul_119.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_677_ACMP_fmul_120.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_681_ACMP_fmul_121.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_685_ACMP_fmul_122.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_689_ACMP_fmul_123.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_693_ACMP_fmul_124.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_697_ACMP_fmul_125.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_711_ACMP_fdiv_126.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_715_ACMP_fdiv_127.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_720_ACMP_fcmp_128.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_725_ACMP_fcmp_129.v">>raptor_tcl.tcl || echo "" 
    [ -z "$ip_name" ] && echo "add_design_file ./rtl/sphericalCoordinates_grp_fu_730_ACMP_fcmp_130.v">>raptor_tcl.tcl || echo "" 
    ##vary design to design

    echo "set_top_module sphericalCoordinates">>raptor_tcl.tcl 

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