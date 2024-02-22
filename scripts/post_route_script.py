import sys
import os

def rename_outputs(design_output,netlist_output,signal_names):
    renamed_signal_list = [item.replace(design_output,netlist_output) for item in signal_names]
    return renamed_signal_list

def get_wire_lines(file_path,number_of_outputs):
    wire_lines = []
    with open(file_path, 'r') as file:
        for line in file:
            if "wire" in line:
                wire_lines.append(line.strip())
                if len(wire_lines) == number_of_outputs:
                    break
    return wire_lines

def extract_signal_names_from_file(file_path):
    signal_declarations = []
    with open(file_path, 'r') as f:
        for line in f:
            line = line.strip()
            if line.startswith("input") or line.startswith("output"):
                signal_declarations.append(line.split('\\')[1])
            # if line.startswith("output"):
            #     print(line.split('\\')[1])
    signal_names = []
    for declaration in signal_declarations:
        signal_names.extend(declaration.split()[1:])
    return signal_declarations

design_name=sys.argv[1]

verilog_file_path = design_name+"/run_1/synth_1_1/impl_1_1_1/routing/"+design_name+"_post_route.v"

signal_names = extract_signal_names_from_file(verilog_file_path)

files_in_subdirectory = os.listdir("../sim/co_sim_tb/")

if len(files_in_subdirectory) == 1:
    testbench_file_name = files_in_subdirectory[0]
else:
    print("sim/co_sim_tb folder contain multiple files. Keep only testbench in this folder")

with open("../sim/co_sim_tb/"+testbench_file_name, "r") as f:
    testbench_content = f.readlines()

if len(sys.argv) >= 3 and sys.argv[2] != "":
    number_of_outputs = int(sys.argv[2])
else:
    number_of_outputs = 0

if number_of_outputs > 1:
    wire_lines = get_wire_lines("../sim/co_sim_tb/"+testbench_file_name,number_of_outputs)
    for line in wire_lines:
        if "[" not in line:
            design_output=line.strip().split(' ')[1].split(',')[0]
            netlist_output=line.strip().split(',')[1].replace(" ", "").replace(";", "")
            signal_names = rename_outputs(design_output,netlist_output,signal_names)
        else:
            design_output=line.strip().split(' ')[2].split(',')[0]
            netlist_output=line.strip().split(',')[1].replace(" ", "").replace(";", "")
            signal_names = rename_outputs(design_output,netlist_output,signal_names)
    renamed_signal_list = signal_names
else:
    for i, line in enumerate(testbench_content):
        if "wire" in line:
            if "[" not in line:
                design_output=line.strip().split(' ')[1].split(',')[0]
                netlist_output=line.strip().split(',')[1].replace(" ", "").replace(";", "")
                break
            else:
                design_output=line.strip().split(' ')[2].split(',')[0]
                netlist_output=line.strip().split(',')[1].replace(" ", "").replace(";", "")
                break
    renamed_signal_list = [item.replace(design_output,netlist_output) for item in signal_names]

renamed_signal_list.reverse()

insert_line_index = None
for i, line in enumerate(testbench_content):
    if design_name+"_post_route netlist" in line:
        insert_line_index = i + 1  
        break

if insert_line_index is not None and insert_line_index < len(testbench_content):
    next_line = testbench_content[insert_line_index].strip()
    if next_line == "" or next_line.endswith(";"):
        for item in renamed_signal_list:
            testbench_content.insert(insert_line_index, item.strip() + "\n")
        with open("../sim/co_sim_tb/"+testbench_file_name, "w") as f:
            f.writelines(testbench_content)
    else:
        print("Instance Ports in PNR Testbench are Already Updated")
else:
    print("PNR Netlist Instance Not Found In PNR Testbench")

