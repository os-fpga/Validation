import re
import sys
import os
import shutil

design_name=sys.argv[1]

def extract_signals(verilog_path):
    with open(verilog_path, 'r') as file:
        content = file.read()

    # Extract the module name
    module_name_match = re.search(r'module (\w+)', content)
    if not module_name_match:
        print("Module name not found")
        return None

    module_name = module_name_match.group(1)

    # Assuming content is already defined and contains your Verilog file content
    input_signals = re.findall(r'input\s+\\?(\w+[\[\]\d]*)', content)
    output_signals = re.findall(r'output\s+\\?(\w+[\[\]\d]*)', content)

    # Initialize an empty list
    output_with_postfix_netlist = []
    # index_of_outputs = []
    # Iterate through each signal in output_signals
    for signal in output_signals:
        # Split the signal at '[' and take the first part, then append '_netlist'
        modified_signal = signal.split('[')[0] + '_netlist'
        index_of_outputs = '[' + signal.split('[')[1]
        # Append the modified signal to the list
        output_with_postfix_netlist.append(modified_signal + index_of_outputs)


    # Format signals
    input_signals_formatted = ',\n    '.join(input_signals)
    output_signals_formatted = ',\n    '.join([f"{signal}" for signal in output_with_postfix_netlist])

    signals_formatted = f"{input_signals_formatted},\n    {output_signals_formatted}"

    return module_name, signals_formatted

def insert_signals_in_testbench(verilog_path, module_name, signals_formatted):
    # Assuming the testbench file is in the same directory but named differently
    testbench_path = f"../sim/co_sim_tb/co_sim_{design_name}.v"
    testbench_temp_path = f"../sim/co_sim_tb/co_sim_{design_name}_temp.v"  # Temp file with _temp postfix

    # First, copy the original testbench file to a temp file
    shutil.copy(testbench_path, testbench_temp_path)

    # Read the testbench, modify it, and write back
    with open(testbench_path, 'r') as file:
        content = file.readlines()
    
    with open(testbench_path, 'w') as file:
        insert_point_found = False
        for line in content:
            if '`ifdef PNR' in line and not insert_point_found:
                # Insert the formatted signals after the specific line
                file.write(line)
                netlist_instance = f"    {module_name} netlist(\n    {signals_formatted} );\n"
                file.write(netlist_instance)
                insert_point_found = True
            else:
                file.write(line)

if __name__ == "__main__":
    verilog_path = design_name+"/run_1/synth_1_1/impl_1_1_1/routing/"+design_name+"_post_route.v"  # Replace <design_name> with your actual design name
    module_name, signals_formatted = extract_signals(verilog_path)
    if module_name and signals_formatted:
        insert_signals_in_testbench(verilog_path, module_name, signals_formatted)
    else:
        print("Failed to extract signals or module name.")
 
