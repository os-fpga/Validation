#!/usr/bin/env tclsh
#  Usage: 
#   ./RunGJC.tcl raptor_path=<your raptor exe path>  
#

set raptor_path "/home/alain/os-fpga/Raptor/build/bin/raptor"

regexp {raptor_path=([a-zA-Z0-9/\.-]+)} $argv tmp raptor_path

puts "Raptor: $raptor_path"
puts "Device: $device"
puts "GJC Begin Run"

foreach dirName [glob -nocomplain -type {d} GJC* ] {
    cd $dirName
    puts "Creating raptor_tcl.tcl for TESTCASE: $dirName"
    set result ""
    exec sh -c "rm -rf results_dir"
    catch {set result [exec sh -c "./raptor_run.sh"]} result
    exec sh -c "rm -rf results_dir/$dirName"
    exec sh -c "rm -rf $dirName"
    exec sh -c "rm -rf results_dir/raptor.log"
    cd ..
}

foreach dirName [glob -nocomplain -type {d} GJC* ] {
    cd $dirName/results_dir
    puts "Running TESTCASE: $dirName"
    set result ""
    catch {set result [exec sh -c "$raptor_path --script ../raptor_tcl.tcl --batch"]} result
    if ![regexp "bitstream is generated" $result] {
        puts "  Test failed: $dirName/results_dir/raptor.log"
        puts "        Error: [string range $result 0 200]"
    }
    cd ../..
}

puts "GJC End Run"
