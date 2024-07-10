#!/usr/bin/env tclsh
#  Usage: 
#   ./RunGJC.tcl raptor_path=<your raptor exe path>  
#

set raptor_path "/home/alain/os-fpga/Raptor/build/bin/raptor"

regexp {raptor_path=([a-zA-Z0-9/\.-]+)} $argv tmp raptor_path

set logId [open "RunGJC.log" "w"]

proc log { msg } {
    global logId
    puts $msg
    puts $logId $msg
    flush $logId
}


log "Raptor: $raptor_path"
log "GJC Begin Run"

foreach dirName [glob -nocomplain -type {d} GJC* ] {
    cd $dirName
    log "Creating raptor_tcl.tcl for TESTCASE: $dirName"
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
    log "Running TESTCASE: $dirName"
    set result ""
    catch {set result [exec sh -c "$raptor_path --script ../raptor_tcl.tcl --batch"]} result
    if ![regexp "bitstream is generated" $result] {
        log "  Test failed: $dirName/results_dir/raptor.log"
    }
    cd ../..
}

log "GJC End Run"
