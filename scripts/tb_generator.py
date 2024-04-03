import os
import random
import json
import sys

def create_folders_and_file():
    design = sys.argv[1]
    design_path = sys.argv[2]

    # Construct the path to port_info.json using *
    port_info_path = os.path.join(
        design_path,
        "results_dir",
        design,
        "run_1",
        "synth_1_1",
        "synthesis",
        "port_info.json"
    )

    # Define the folder names
    main_folder = os.path.join(design_path, "sim")
    sub_folder = os.path.join(main_folder, "co_sim_tb")
    file_string = "co_sim_"
    rtl_inst = "golden (.*);"
    
    # List to instantiate post_synth
    wire_instances = []
    p_name_compare = []
    p_name_netlist = []
    
    # List to check outputs
    out_instances = []

    # Create the main folder "sim"
    try:
        os.mkdir(main_folder)
    except FileExistsError:
        print(f"Folder '{main_folder}' already exists.")

    # Create the sub folder "co_sim_tb" inside "sim"
    sub_folder_path = os.path.join(main_folder, sub_folder)
    try:
        os.mkdir(sub_folder_path)
    except FileExistsError:
        print(f"Folder '{sub_folder}' already exists inside '{main_folder}'.")

    # Read the JSON file
    with open(port_info_path) as json_file:
        data = json.load(json_file)

    # Extract topModule
    top_module = data['top']

    # Create a file with the topModule name
    filename = file_string + top_module + ".v"
    output_filename = os.path.join(sub_folder_path, filename) 
    # Extract port information

    input_ports = []
    output_ports = []
    clk_port = []
    reset_port = []
    wire_instances = []
    p_name_compare = []
    p_name_netlist = []
    bit_width_list = []
    ports = {}
    for port in data['ports']:
        if "clock" in port:
            clk_port.append(port["name"])
        elif "sync_reset" in port:
            reset_port.append(port["name"])
            sync_reset_value = port["sync_reset"]
        elif "async_reset" in port:
            reset_port.append(port["name"])
            sync_reset_value = port["async_reset"]
        else:
            port_name = port["name"]
            port_direction = port["direction"]
            if "[" in port_name:
                bus_name, bus_width = port_name.split("[")
                bus_width = "[" + bus_width
                if bus_name not in ports:
                    ports[bus_name] = {"direction": port_direction, "width": bus_width}
                else:
                    existing_width = ports[bus_name]["width"]
                    if existing_width is None:
                        ports[bus_name]["width"] = bus_width
                    else:
                        existing_width_int = int(existing_width.strip("[]"))
                        new_width_int = int(bus_width.strip("[]"))
                        max_width = max(existing_width_int, new_width_int)
                        ports[bus_name]["width"] = f"[{max_width}]"
            else:
                ports[port_name] = {"direction": port_direction, "width": None}
           
    # Separate input and output ports    
    for port, info in ports.items():
        if info["direction"] == "input":
            input_ports.append(port)
            if info["width"] is not None:
                width_str = info["width"].strip("[]")
                width_int = int(width_str) + 1
                bit_width_list.append(width_int)
            else:
                bit_width_list.append(None)
        elif info["direction"] == "output":
            output_ports.append(port)
            
    # Write module name and port information to a file
    with open(output_filename, "w") as file:
        file.write("module " + file_string + top_module + ";\n")
        if clk_port:
            file.write("// Clock signals\n")
            for port in clk_port:
                file.write("    reg " + port + ";\n")

        # Check if reset_port list is not empty and write its contents to the file
        if reset_port:
            file.write("// Reset signals\n")
            for port in reset_port:
                file.write("    reg " + port + ";\n")
            file.write("\n")
        for i, (port, info) in enumerate(ports.items()):
            if i != 0:
                file.write(";\n")
            if info["width"] is not None:
                if "]" in info["width"]:
                    info["width"] = info["width"].replace("]", ":0]")
                if info["direction"] == "input":
                    file.write("    reg \t\t" + info["width"] + " \t\t" + port)
                elif info["direction"] == "output":
                    p_name_inst     = port + "_netlist"
                    p_name_with_netlist = port + "\t,\t" + p_name_inst
                    p_name_compare.append(port)
                    p_name_netlist.append(p_name_inst)
                    wire_instances.append(".{}({})".format(port, p_name_inst))
                    out_instances.append("{} !== {}".format(port, p_name_inst))
                    file.write("    wire \t\t" + info["width"] + " \t\t" + p_name_with_netlist)
            else:
                if info["direction"] == "input":
                    file.write("    reg \t\t" + port)
                elif info["direction"] == "output":
                    p_name_inst     = port + "_netlist"
                    p_name_with_netlist = port + "\t,\t" + p_name_inst
                    p_name_compare.append(port)
                    p_name_netlist.append(p_name_inst)
                    wire_instances.append(".{}({})".format(port, p_name_inst))
                    out_instances.append("{} !== {}".format(port, p_name_inst))
                    file.write("    wire \t\t" + p_name_with_netlist)
        
        file.write(";\n\tinteger\t\tmismatch\t=\t0;\n\n")
        file.write(top_module + "\t" + rtl_inst + "\n\n`ifdef PNR\n`else\n")
        file.write("\t" + top_module + '_post_synth synth_net (.*, {} );\n'.format(', '.join(wire_instances)) + "`endif\n\n" )
        
        if len(clk_port) == 0:
            print("FOUND COMBINATIONAL DESIGN")
            # initialize values to zero
            if len(input_ports) > 1:
              file.write("// Initialize values to zero \ninitial\tbegin\n\t{")
              input_port_str = ', '.join(input_ports)
              input_port_str += " } <= 'd0;"
              print(input_port_str, file=file) 
            else:
              file.write("// Initialize values to zero \ninitial\tbegin\n\t" + str(input_ports[0]) + " <= 'd0;\n")
            # generate random stimulus
            file.write('\t#50;\n\tcompare();\n// Generating random stimulus \n\tfor (int i = 0; i < 100; i = i + 1) begin\n') 
            random_stimulus_lines = []
            for port in input_ports:
                random_stimulus_lines.append(f'{port} <= $random();')    
            for rand_line in random_stimulus_lines:
              file.write('\t\t' + rand_line + '\n')
            file.write('\t\t#50;\n\t\tcompare();\n\tend\n\n')            
            
            # generate corner case stimulus 
            file.write("\t// ----------- Corner Case stimulus generation -----------\n")
            max_values = []
            for bit_width in bit_width_list:
                if bit_width is None:
                    bit_width = 1  # Consider None as 1 for the port
                max_value = 2**bit_width - 1
                max_values.append(max_value)
            # Create stimulus assignments for each input port
            stimulus_lines = []
            for port, max_value in zip(input_ports, max_values):
              stimulus_lines.append(f'{port} <= {max_value};')
            for line in stimulus_lines:
              file.write('\t' + line + '\n')
            file.write('\tcompare();\n\t#50;\n\tif(mismatch == 0)\n\t\t$display("**** All Comparison Matched *** \\n\t\tSimulation Passed\\n");\n\telse\n\t\t')
            file.write('$display("%0d comparison(s) mismatched\\nERROR: SIM: Simulation Failed", mismatch);\n\t#50;\n\t$finish;\nend\n\n') 
        else:
            print ("FOUND SEQUENTIAL DESIGN")
            for clk in clk_port:
                file.write('//clock initialization for ' + clk + '\n')
                file.write('    initial begin\n')
                file.write('        ' + clk + " = 1'b0;\n")
                file.write('        forever #5 ' + clk + ' = ~' + clk + ';\n')
                file.write('    end\n')      
            
            # check for reset signal 
            if len(reset_port) == 0:  
                print("No Reset Signal Found")
                # initialize values to zero
                for clk in clk_port:
                    file.write("// Initialize values to zero \ninitial\tbegin\n\t{")
                    if len(input_ports) > 1:
                        input_port_str = ', '.join(input_ports)
                        input_port_str += " } <= 'd0;"
                        print(input_port_str, file=file) 
                        file.write("\t repeat (2) @ (negedge " + clk + "); ")
                    else:
                        file.write("// Initialize values to zero \ninitial\tbegin\n\t" + str(input_ports[0]) + 
                                    " <= 'd0;\n\t repeat (2) @ (negedge " + clk + "); ")
                    # generate random stimulus
                    file.write('\n\tcompare();\n\t//Random stimulus generation\n\trepeat(100) @ (negedge ' + clk + ') begin\n')
                    random_stimulus_lines = []
                    for port in input_ports:
                        random_stimulus_lines.append(f'{port} <= $random();')    
                    for rand_line in random_stimulus_lines:
                        file.write('\t\t' + rand_line + '\n')
                    file.write('\n\t\tcompare();\n\tend\n\n')            
                    
                    # generate corner case stimulus 
                    file.write("\t// ----------- Corner Case stimulus generation -----------\n")
                    max_values = []
                    for bit_width in bit_width_list:
                        if bit_width is None:
                            bit_width = 1  # Consider None as 1 for the port
                        max_value = 2**bit_width - 1
                        max_values.append(max_value)
                    # Create stimulus assignments for each input port
                    stimulus_lines = []
                    for port, max_value in zip(input_ports, max_values):
                        stimulus_lines.append(f'{port} <= {max_value};')
                    for line in stimulus_lines:
                        file.write('\t' + line + '\n')
                    file.write('\trepeat (2) @ (negedge ' + clk + ');\n\tcompare();\n\tif(mismatch == 0)\n\t\t$display("**** All Comparison Matched *** \\n\t\tSimulation Passed\\n");\n\telse\n\t\t')
                    file.write('$display("%0d comparison(s) mismatched\\nERROR: SIM: Simulation Failed", mismatch);\n\t#50;\n\t$finish;\nend\n\n')  
            else:
                print("Found Reset Signal:")
                # Check sync_reset value and write stimulus generation accordingly
                file.write ("//Reset Stimulus generation\ninitial begin\n")
                for clk in clk_port:
                    for rst in reset_port:
                        if not input_ports:
                            if sync_reset_value == "active_high":
                                file.write("\t" + rst + ' <= 1;\n\t@(negedge ' + clk + ');\n' )               
                                file.write('\t' + rst + ' <= 0;\n\t@(negedge ' + clk + ');\n')
                            else:
                                file.write("\t" + rst + ' <= 0;\n\t@(negedge ' + clk + ');\n\t' )          
                                file.write('\t' + rst + ' <= 1;\n\t@(negedge ' + clk + ');\n')                        
                        else:
                            if sync_reset_value == "active_high":
                                file.write("\t" + rst + ' <= 1;\n\t@(negedge ' + clk + ');\n\t{' )
                                input_port_str = ', '.join(input_ports)
                                input_port_str += " } <= 'd0;"
                                print(input_port_str, file=file)                
                                file.write('\t' + rst + ' <= 0;\n\t@(negedge ' + clk + ');\n')
                            else:
                                file.write("\t" + rst + ' <= 0;\n\t@(negedge ' + clk + ');\n\t{' )
                                input_port_str = ', '.join(input_ports)
                                input_port_str += " } <= 'd0;"
                                print(input_port_str, file=file)                
                                file.write('\t' + rst + ' <= 1;\n\t@(negedge ' + clk + ');\n')
                file.write('\t$display ("***Reset Test is applied***");\n\t@(negedge ' + 
                              clk + ');\n\t@(negedge ' + clk + ');\n\tcompare();\n\t$display ("***Reset Test is ended***");\n')
                # Generate random stimulus values for each input port
                file.write('\t//Random stimulus generation\n\trepeat(100) @ (negedge ' + clk + ') begin\n')
                random_stimulus_lines = []
                for port in input_ports:
                    random_stimulus_lines.append(f'{port} \t\t <= $random();')    
                for rand_line in random_stimulus_lines:
                    file.write('\t\t' + rand_line + '\n')
                file.write('\t\tcompare();\nend\n\n')

                file.write("\t// ----------- Corner Case stimulus generation -----------\n")
                
                # Generate Corner Case stimulus for remaining INPUTS
                max_values = []
                for bit_width in bit_width_list:
                    if bit_width is None:
                        bit_width = 1  # Consider None as 1 for the port
                    max_value = 2**bit_width - 1
                    max_values.append(max_value)
                # Create stimulus assignments for each input port
                stimulus_lines = []
                for port, max_value in zip(input_ports, max_values):
                    stimulus_lines.append(f'{port} <= {max_value};')
                for line in stimulus_lines:
                    file.write('\t' + line + '\n')
                file.write('\tcompare();\n\n\tif(mismatch == 0)\n\t\t$display("**** All Comparison Matched *** \\n\t\tSimulation Passed\\n");\n\telse\n\t\t')
                file.write('$display("%0d comparison(s) mismatched\\nERROR: SIM: Simulation Failed", mismatch);\n\trepeat(50) @(posedge ' + clk + ');\n\t$finish;\nend\n\n')
                      
        # compare task
        dec = len(out_instances)
        dec_string = ["%0d"] * dec
        dec_string = ", ".join(dec_string)
        file.write("task compare();\n")
        file.write('\tif ( {} ) begin\n'.format('\t||\t'.join(out_instances) ))
        file.write('\t\t$display("Data Mismatch: Actual output: ' + dec_string + ", Netlist Output " +
        dec_string + ', Time: %0t ", ')
        for ports in p_name_compare:
          file.write("%s, " % ports)
        for net_ports in p_name_netlist:
          file.write("%s, " % net_ports)
        file.write( ' $time);\n\t\tmismatch = mismatch+1;\n\tend\n\telse\n\t\t$display("Data Matched: Actual output: ' + 
        dec_string + ", Netlist Output " + dec_string + ', Time: %0t ", ')
        for ports in p_name_compare:
          file.write("%s, " % ports)
        for net_ports in p_name_netlist:
          file.write("%s, " % net_ports)
        file.write( ' $time);\nendtask\n\n')
        
        file.write('initial begin\n\t$dumpfile("tb.vcd");\n\t$dumpvars;\nend\n\nendmodule\n')

if __name__ == "__main__":
    create_folders_and_file()
