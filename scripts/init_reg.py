"""
Description:
This script processes Verilog files to initialize all 'reg' signals to zero. It reads the Verilog code from an input file, applies modifications to initialize 'reg' declarations, and writes the updated code to either the same file or a specified output file.

Usage:
python3 init_reg.py <input_verilog_file> [output_verilog_file]

Parameters:
- input_verilog_file: The path to the Verilog file to be processed.
- output_verilog_file: (Optional) The path to the output file where the updated Verilog code will be written. If not provided, the input file will be overwritten.

Notes:
- The script identifies 'reg' declarations and ensures that each register is initialized to zero.(Output reg excluded)
- It handles bit-width declarations and trailing semicolons or commas.
"""


import re
import sys

def initialize_reg_signals(verilog_code):
    print(repr(verilog_code))
    # Regex to match reg declarations
    reg_pattern = r'''
    (?P<leading_spaces>\s*)               # Captures leading spaces before 'reg'
    (?P<declaration>reg\s+)               # Matches 'reg'
    \s*(?P<bit_width>\[\d+:\d+\])?              # Optional bit-width
    \s*(?P<regs>[\w\s,]+)                       # Matches registers
    \s*(?P<ending>[;])                       # Optional semicolon(s) or spaces
    '''
    
    def add_zero_initialization(match):

        print("1:",match.group('declaration'))
        print("2:",match.group('bit_width') or '')
        print("3:",match.group('regs').strip())
        print("=======")
        
        leading_spaces = match.group('leading_spaces')
        declaration = match.group('declaration').strip()
        bit_width = match.group('bit_width') or ''
        regs = match.group('regs').strip()
   
        # Initialize each register
        initialized_regs = ', '.join([f'{reg.strip()}=0' for reg in regs.split(',')])
        
        # Add a semicolon if needed
        if initialized_regs and not initialized_regs.endswith(';'):
            initialized_regs += ';'

        return f'{leading_spaces}{declaration}{bit_width} {initialized_regs}'
    
    # Substitute all matched patterns in the Verilog code
    updated_code = re.sub(reg_pattern, add_zero_initialization, verilog_code, flags=re.VERBOSE)
    
    return updated_code

def process_verilog_file(input_file, output_file=None):
    # Read the input Verilog file
    with open(input_file, 'r') as file:
        verilog_code = file.read()
    
    # Modify the Verilog code
    updated_verilog_code = initialize_reg_signals(verilog_code)
    
    # Write the updated code back to the file (or another file if specified)
    if output_file:
        with open(output_file, 'w') as file:
            file.write(updated_verilog_code)
        print(f"Updated Verilog written to {output_file}")
    else:
        with open(input_file, 'w') as file:
            file.write(updated_verilog_code)
        print(f"Updated Verilog written to {input_file}")

if __name__ == "__main__":
    # Check for arguments
    if len(sys.argv) < 2:
        print("Usage: python3 init_reg.py <input_verilog_file> [output_verilog_file]")
        sys.exit(1)
    
    input_file = sys.argv[1]
    output_file = sys.argv[2] if len(sys.argv) > 2 else None
    
    process_verilog_file(input_file, output_file)
