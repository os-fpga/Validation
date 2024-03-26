import os
import re
import random
import json
import sys

def check_clock_declaration(port_names):
    clock_pattern =  r"\b(?i:(?:clock|clk|clck)\w*|CLOCK)\b(?:\s*(?:[\[\]\w]+[,\s]*)*)"

    # Search for the combined clock pattern in the list of port names
    for index, port_name in enumerate(port_names):
        match = re.search(clock_pattern, port_name)
        if match:
            # Return the port name and its index
            return index

    # Return None if clock signal not found
    return None

def check_sync_reset(ports):
    # Iterate through the list of ports
    for port in ports:
        if "sync_reset" in port:
            # Extract the reset signal name
            reset_signal_name = port['name']
            sync_reset_value = port['sync_reset']
            return reset_signal_name, sync_reset_value

    # Return None if no sync_reset found
    return None, None

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
        "analysis",
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
    bit_widths = []
    
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
    top_module = data[0]['topModule']

    # Extract I/O ports info
    ports = data[0]['ports']
    # Filter and store only INPUT port names
    input_port_names = [port['name'] for port in ports if port['direction'] == "Input"]

    # Create a file with the topModule name
    filename = file_string + top_module + ".v"
    output_filename = os.path.join(sub_folder_path, filename) 
    with open(output_filename, "w") as outfile:
        # Write module header
        outfile.write("module " + file_string + top_module + ";\n")

        # Write input and output ports
        for i, port in enumerate(ports):
            direction = port['direction']
            name = port['name']
            range_lsb = port['range']['lsb']
            range_msb = port['range']['msb']
            port_type = port['type']
            
            # Replace "input" with "reg" and "output" with "wire"
            if direction == "Input":
                direction = "reg"
                # Calculate the bit width of the port
                bit_width = range_msb - range_lsb + 1
                bit_widths.append(bit_width)
            elif direction == "Output":
                direction = "wire"

              # Append "_netlist" to p.name if mode_str is "wire"
            if direction == "wire":
              p_name_modified = name + "\t,\t" + name + "_netlist"
              p_name_inst     = name + "_netlist"
              p_name_compare.append(name)
              p_name_netlist.append(p_name_inst)
              wire_instances.append(".{}({})".format(name, p_name_inst))
              out_instances.append("{} !== {}".format(name, p_name_inst))
            else:
              p_name_modified = name

            # Check if single-bit port
            if range_lsb == range_msb:
                range_str = ""
            else:
                range_str = f"[{range_msb}:{range_lsb}]"

            # Write port declaration
            outfile.write(f"\t{direction}\t\t\t\t{range_str}\t\t\t{p_name_modified};\n")
        outfile.write("\tinteger\tmismatch\t=\t0;\n\n")
        outfile.write(top_module + "\t" + rtl_inst + "\n\n`ifdef PNR\n`else\n")
        outfile.write("\t" + top_module + '_post_synth synth_net (.*, {} );\n'.format(', '.join(wire_instances)) + "`endif\n\n" )
        
        clock_port = check_clock_declaration(input_port_names)
        clk = input_port_names[clock_port] if clock_port is not None else None
        
        if clk is not None:
            print("FOUND SEQUENTIAL DESIGN - Clock Signal:", clk ,"at index", clock_port)
            outfile.write('//clock initialization\ninitial begin\n\t' + str(clk) + 
                          " = 1'b0;\n\tforever #5 " + str(clk) + ' = ~' + str(clk) + ';\nend\n\n')

            index_clock = input_port_names.index(clk)
            del input_port_names[clock_port]
            del bit_widths[index_clock]
            
            # check for reset signal 
            reset_port_name, sync_reset_value = check_sync_reset(ports)
            print (input_port_names)
            print (bit_widths)
            
            if reset_port_name is not None:
                print("Found Reset Signal:", reset_port_name)
                index_reset = input_port_names.index(reset_port_name)
                del bit_widths[index_reset]
                # Check sync_reset value and write stimulus generation accordingly
                if sync_reset_value == "active_high":
                    outfile.write("// Reset High Stimulus generation\ninitial begin\n\t")
                else:
                    outfile.write("// Reset Low Stimulus generation\ninitial begin\n\t")
                
                # Remove reset port name from port_names
                input_port_names.remove(reset_port_name)
            else:
                print("No Reset Signal Found")
                # initialize values to zero
                if len(input_port_names) > 1:
                    outfile.write("// Initialize values to zero \ninitial\tbegin\n\t{")
                    input_port_str = ', '.join(input_port_names)
                    input_port_str += " } <= 'd0;"
                    print(input_port_str, file=outfile) 
                    outfile.write("\t repeat (2) @ (negedge " + clk + "); ")
                else:
                    outfile.write("// Initialize values to zero \ninitial\tbegin\n\t" + str(input_port_names[0]) + 
                                  " <= 'd0;\n\t repeat (2) @ (negedge " + clk + "); ")
                # generate random stimulus
                outfile.write('\n\tcompare();\n\t//Random stimulus generation\n\trepeat(100) @ (negedge ' + clk + ') begin\n')
                random_stimulus_lines = []
                for port in input_port_names:
                    random_stimulus_lines.append(f'{port} <= $random();')    
                for rand_line in random_stimulus_lines:
                    outfile.write('\t\t' + rand_line + '\n')
                outfile.write('\n\t\tcompare();\n\tend\n\n')            
                
                # generate corner case stimulus 
                outfile.write("\t// ----------- Corner Case stimulus generation -----------\n")
                max_values = []
                for bit_width in bit_widths:
                    if bit_width is None:
                        bit_width = 0  # Consider None as 1 for the port
                    max_value = 2**bit_width - 1
                    max_values.append(max_value)
                # Create stimulus assignments for each input port
                stimulus_lines = []
                for port, max_value in zip(input_port_names, max_values):
                    stimulus_lines.append(f'{port} <= {max_value};')
                for line in stimulus_lines:
                    outfile.write('\t' + line + '\n')
                outfile.write('\trepeat (2) @ (negedge ' + clk + ');\n\tcompare();\n\tif(mismatch == 0)\n\t\t$display("**** All Comparison Matched *** \\n\t\tSimulation Passed\\n");\n\telse\n\t\t')
                outfile.write('$display("%0d comparison(s) mismatched\\nERROR: SIM: Simulation Failed", mismatch);\n\t#50;\n\t$finish;\nend\n\n') 
                
            
            # drive stimulus to remaining inputs
            
        else:
            print("FOUND COMBINATIONAL DESIGN")
            print (input_port_names)
            print (bit_widths)
            # initialize values to zero
            if len(input_port_names) > 1:
              outfile.write("// Initialize values to zero \ninitial\tbegin\n\t{")
              input_port_str = ', '.join(input_port_names)
              input_port_str += " } <= 'd0;"
              print(input_port_str, file=outfile) 
            else:
              outfile.write("// Initialize values to zero \ninitial\tbegin\n\t" + str(input_port_names[0]) + " <= 'd0;\n")
            # generate random stimulus
            outfile.write('\t#50;\n\tcompare();\n// Generating random stimulus \n\tfor (int i = 0; i < 100; i = i + 1) begin\n') 
            random_stimulus_lines = []
            for port in input_port_names:
                random_stimulus_lines.append(f'{port} <= $random();')    
            for rand_line in random_stimulus_lines:
              outfile.write('\t\t' + rand_line + '\n')
            outfile.write('\t\t#50;\n\t\tcompare();\n\tend\n\n')            
            
            # generate corner case stimulus 
            outfile.write("\t// ----------- Corner Case stimulus generation -----------\n")
            max_values = []
            for bit_width in bit_widths:
                if bit_width is None:
                    bit_width = 0  # Consider None as 1 for the port
                max_value = 2**bit_width - 1
                max_values.append(max_value)
            # Create stimulus assignments for each input port
            stimulus_lines = []
            for port, max_value in zip(input_port_names, max_values):
              stimulus_lines.append(f'{port} <= {max_value};')
            for line in stimulus_lines:
              outfile.write('\t' + line + '\n')
            outfile.write('\tcompare();\n\t#50;\n\tif(mismatch == 0)\n\t\t$display("**** All Comparison Matched *** \\n\t\tSimulation Passed\\n");\n\telse\n\t\t')
            outfile.write('$display("%0d comparison(s) mismatched\\nERROR: SIM: Simulation Failed", mismatch);\n\t#50;\n\t$finish;\nend\n\n')  
        
        # compare task
        dec = len(out_instances)
        dec_string = ["%0d"] * dec
        dec_string = ", ".join(dec_string)
        outfile.write("task compare();\n")
        outfile.write('\tif ( {} ) begin\n'.format('\t||\t'.join(out_instances) ))
        outfile.write('\t\t$display("Data Mismatch: Actual output: ' + dec_string + ", Netlist Output " +
        dec_string + ', Time: %0t ", ')
        for ports in p_name_compare:
          outfile.write("%s, " % ports)
        for net_ports in p_name_netlist:
          outfile.write("%s, " % net_ports)
        outfile.write( ' $time);\n\t\tmismatch = mismatch+1;\n\tend\n\telse\n\t\t$display("Data Matched: Actual output: ' + 
        dec_string + ", Netlist Output " + dec_string + ', Time: %0t ", ')
        for ports in p_name_compare:
          outfile.write("%s, " % ports)
        for net_ports in p_name_netlist:
          outfile.write("%s, " % net_ports)
        outfile.write( ' $time);\nendtask\n\n')
        
        outfile.write('initial begin\n\t$dumpfile("tb.vcd");\n\t$dumpvars;\nend\n\nendmodule\n')



if __name__ == "__main__":
    create_folders_and_file()


