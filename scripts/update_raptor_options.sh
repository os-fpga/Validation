#!/bin/bash

export PATH=/nfs_scratch/scratch/FV/awais/Synthesis/OS-FPGA/Raptor/build/bin/:$PATH 
strategy="area"
synth_options="-fsm_encoding onehot -carry auto"