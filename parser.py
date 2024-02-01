#Owner: Abdul Hameed Akram
#Dated: 30/01/2023
#Description: This code reads in a list of log files and a mapping of keywords for each file. 
#             It then processes each file and extracts information based on the keywords provided 
#             in the keywords.json. The extracted information is stored in a dictionary and 
#             written to a json file called "parsed_data.json".


# Importing the json module
import json
import sys
import os
import glob

import subprocess
import re
import math

def find_period_in_sdc(file_name, keyword, single_clock_design):
    numerical_value = None

    with open(file_name, 'r') as file:
        for line in file:
            if "create_clock" in line:
                if (single_clock_design):
                    match = re.search(r'[-+]?\d*\.\d+|\d+', line)
                    if match:
                        numerical_value = float(match.group())
                    break
                else:
                    if keyword in line:
                        match = re.search(r'[-+]?\d*\.\d+|\d+', line)
                        if match:
                            numerical_value = float(match.group())
                        break

    return numerical_value,keyword

def clock_and_wns():

    # Run the 'tac raptor.log' command
    tac_process = subprocess.Popen(['tac', 'results_dir/raptor.log'], stdout=subprocess.PIPE)

    # Run the 'grep -i "final intra-domain worst setup" -m1 -B10' command
    grep1_process = subprocess.Popen(['grep', '-i', 'final intra-domain worst setup', '-m1', '-B10'],
                                     stdin=tac_process.stdout, stdout=subprocess.PIPE)

    # Run the 'tac' command again
    tac2_process = subprocess.Popen(['tac'], stdin=grep1_process.stdout, stdout=subprocess.PIPE)

    # Run the 'grep -i "final inter-domain" -B999999' command
    grep2_process = subprocess.Popen(['grep', '-i', 'final inter-domain', '-B999999'],
                                     stdin=tac2_process.stdout, stdout=subprocess.PIPE)

    # Run the final 'grep "slack:"' command
    final_grep_process = subprocess.Popen(['grep', 'slack:'], stdin=grep2_process.stdout, stdout=subprocess.PIPE)

    # Get the output of the final grep command
    output, _ = final_grep_process.communicate()

    slack_count=0
    wns_values=[]
    clock_names=[]

    slack_lines=output.decode('utf-8')
    for slk in slack_lines.split("\n"):
        if "slack:" in slk:
            wns_values.append(slk.split()[6])
            slack_count += 1

    for i in range(slack_count):
        clock=slack_lines.split("\n")[i].split()[0]
        clock_names.append(clock)
    return slack_count, clock_names, wns_values

def get_llvl(keyword):
    
    current_directory = os.getcwd()
    count = 0
    # Search for files matching the specified pattern
    matching_files = glob.glob(os.path.join(current_directory, '**/timing_analysis/report_timing.setup.rpt'), recursive=True)

    start_keyword = '#Path 1'
    end_keyword = '#Path 2'
    clock_name=""

    # If there are matching files, take the first one
    if matching_files:
        timing_report_path = matching_files[0]
        in_range = False

        with open(timing_report_path, 'r') as file:
            for line in file:
                if end_keyword in line:
                    in_range = False
                    break
                if in_range:
                    if "clock " in line:
                        if "edge)" in line:
                            clock_name=line.split()[1]
                    if keyword in line:
                        count += 1
                elif start_keyword in line:
                    in_range = True
        return count,clock_name
    else:
        return count,clock_name

def find_clock_after_path():
    clock_lines = []
    path_number = None
    unique_list = []

    current_directory = os.getcwd()
    # Search for files matching the specified pattern
    input_file_path = glob.glob(os.path.join(current_directory, '**/timing_analysis/report_timing.setup.rpt'), recursive=True)
    # Read input from the file
    with open(input_file_path[0], "r") as rpt_file:
        rpt_lines = rpt_file.read().splitlines()

    for line in rpt_lines:
        if line.startswith("#Path"):
            path_number = int(line.split()[1])
        elif path_number is not None and line.startswith("clock "):
            clock_lines.append((line.split()[1]))
            path_number = None

    unique_list = list(dict.fromkeys(clock_lines))

    return unique_list

# Defining the function parse_log_files() that takes in a list of log files and a log_line_keys_map
def parse_log_files(file,timing_file,log_line_keys_map):
    # Initializing an empty dictionary to store the parsed data
    data = {}
    # Looping through each key and keyword in the log_line_keys_map for this log file
    for log_line_key, log_line_keyword in log_line_keys_map.items():
        # Initializing the value for this key as N/A or 0 depending on the key
        data[log_line_key] = None

    with open(timing_file, 'r') as timing_f:
        # Adding the current file name as a key to the data dictionary and initializing its value as another dictionary
        # data = {}
        # Reading all the lines of the log file into a list
        lines = timing_f.readlines()

        bitstream_time_line=-1
        timinganalysis_time_line=-1
        Route_time_line=-1
        place_time_line=-1
        pack_time_line=-1
        syn_time_line=-1
        for i in range(len(lines) - 1, -1, -1):        
            if "GenerateBitstream has started" in lines[i]:
                bitstream_time_line = i
                break
        for i in range(len(lines) - 1, -1, -1):        
            if "TimingAnalysis has started" in lines[i]:
                timinganalysis_time_line = i
                break
        for i in range(len(lines) - 1, -1, -1):        
            if "Route has started" in lines[i]:
                Route_time_line = i
                break
        for i in range(len(lines) - 1, -1, -1):        
            if "Placement has started" in lines[i]:
                place_time_line = i
                break
        for i in range(len(lines) - 1, -1, -1):        
            if "Packing has started" in lines[i]:
                pack_time_line = i
                break
        for i in range(len(lines) - 1, -1, -1):        
            if "Synthesize has started" in lines[i]:
                syn_time_line = i
                break

        if bitstream_time_line != -1:
            for line in lines[bitstream_time_line:]:
                if "Duration: " in line:  
                    data['bitstream_runtime'] = int(line.split('ms')[0].split('Duration:')[1])
                    break
        else:
            data['bitstream_runtime'] = None  # Set to None if "GenerateBitstream" is not found

        if timinganalysis_time_line != -1:
            for line in lines[timinganalysis_time_line:]:
                if "Duration: " in line:  
                    data['time_analysis_runtime'] = int(line.split('ms')[0].split('Duration:')[1])
                    break
        else: 
            data['time_analysis_runtime'] = None

        if Route_time_line != -1:
            for line in lines[Route_time_line:]:
                if "Duration: " in line:  
                    data['routing_runtime'] = int(line.split('ms')[0].split('Duration:')[1])
                    break
        else:
            data['routing_runtime'] = None

        interation_placement=0
        place_time=0
        if place_time_line != -1:
            for line in lines[place_time_line:]:
                if "Duration: " in line:  
                    place_time=int(line.split('ms')[0].split('Duration:')[1])+place_time
                    data['placement_runtime'] = place_time
                    interation_placement=interation_placement+1
                    if interation_placement == 2:
                        break
        else:
            data['placement_runtime'] = None

        if pack_time_line != -1:
            for line in lines[pack_time_line:]:
                if "Duration: " in line:  
                    data['packing_runtime'] = int(line.split('ms')[0].split('Duration:')[1])
                    break
        else:
            data['packing_runtime'] = None

        if syn_time_line != -1:
            for line in lines[syn_time_line:]:
                if "Duration: " in line:  
                    data['synthesis_runtime'] = int(line.split('ms')[0].split('Duration:')[1])
                    break
        else:
            data['synthesis_runtime'] = None
    
    with open(file, 'r') as f:
        # Adding the current file name as a key to the data dictionary and initializing its value as another dictionary
        # data = {}
        # Reading all the lines of the log file into a list
        lines = f.readlines()

        run_time_raptor = 0
        temp_string = ""
        temp_list = []
        previous_error_bfr_sim = False # flag to keep track of previous errors
        for line in lines:
            # Looping through each key and keyword in the log_line_keys_map for this log file
            for log_line_key, log_line_keyword in log_line_keys_map.items():
                # Checking if the keyword is in the current line
                if log_line_keyword in line:
                    # Checking the file name and updating the value of the log line key accordingly
                    if log_line_key == 'total_runtime':
                        run_time_raptor=int(line.split(log_line_keyword)[1].strip().split('ms.')[0])+run_time_raptor
                        data[log_line_key] = run_time_raptor
                    elif log_line_key == 'strategy':
                        data[log_line_key] = line.split(log_line_keyword)[1].strip() 
                    elif log_line_key == 'reg_id':
                        data[log_line_key] = line.split(log_line_keyword)[1].strip()
                    elif log_line_key == 'device':
                        data[log_line_key] = line.split(log_line_keyword)[1].strip() 
                    elif log_line_key == 'target device':
                        data[log_line_key] = line.split(log_line_keyword)[1].strip().split('INFO:')[0]
                    elif log_line_key == 'version':
                        data[log_line_key] = line.split(log_line_keyword)[1].strip() 
                    elif log_line_key == 'git_hash':
                        data[log_line_key] = line.split(log_line_keyword)[1].strip() 
                    elif log_line_key == 'built':
                        data[log_line_key] = line.split(log_line_keyword)[1].strip() 
                    elif log_line_key == 'built_type':
                        data[log_line_key] = line.split(log_line_keyword)[1].strip() 
                if log_line_key == 'error_msg':
                    if log_line_keyword and "Memory collision occured" in line:
                        data[log_line_key] = None  # Clears or prevents setting the error message
                    elif log_line_keyword in line:
                        # temp_string = line.split(log_line_keyword)[1].strip() + " " + temp_string
                        # data[log_line_key] = temp_string
                        temp_list.append(line.split(log_line_keyword)[1].strip())
                        data[log_line_key] = ' '.join(map(str,temp_list[-3:]))
                    elif line.split("-")[0] == 'Error':
                        # print (line.split("Error-")[1].strip())
                        data[log_line_key] = temp_string + ",VCS: " + line.split("Error-")[1].strip()
                if log_line_key == 'status':
                    if "ERROR: Memory collision occured" in line:
                        data[log_line_key] = 'Pass'  # Directly set the status to 'Pass' for this specific error
                    else:
                        #the code splits the log line keyword by commas and loops through the resulting list of keywords.
                        status_keywords = log_line_keyword.split(',')
                        for status_keyword in status_keywords:
                            if status_keyword in line:
                                if status_keyword == "ERROR: ":
                                    if "SIM" in line:
                                        if previous_error_bfr_sim: # check if any previous error occurred before SIM
                                            data[log_line_key] = 'Fail'
                                        else:
                                            data[log_line_key] = 'Pass'
                                    else:
                                        previous_error_bfr_sim = True # set flag if any error message appears
                                        data[log_line_key] = 'Fail'
                                else:
                                    data[log_line_key] = 'Pass'
                if log_line_key == 'post_synth_sim_status':
                            #the code splits the log line keyword by commas and loops through the resulting list of keywords.
                            sim_status_keywords = log_line_keyword.split(',')
                            for sim_status_keyword in sim_status_keywords:
                                if sim_status_keyword in line:
                                    if sim_status_keyword == "Simulation Failed":
                                        data[log_line_key] = 'Fail'
                                    elif sim_status_keyword == "Error-":
                                        data[log_line_key] = 'Fail'
                                    elif sim_status_keyword == "All Comparison Matched":
                                        data[log_line_key] = 'Pass'
                                    elif sim_status_keyword == "comparison(s) mismatched":
                                        data[log_line_key] = 'Fail'
                                    elif sim_status_keyword == "Simulation Passed":
                                        data[log_line_key] = 'Pass'
                                    elif sim_status_keyword == "FAIL=0 SKIP=0":
                                        data[log_line_key] = 'Pass'
                                    elif sim_status_keyword == "PASSED":
                                        data[log_line_key] = 'Pass'
                                    elif sim_status_keyword == "SoC Simulation Completed":
                                        data[log_line_key] = 'Pass'
                                    else:
                                        data[log_line_key] = 'Fail'
                if log_line_key == 'post_route_sim_status':
                            data[log_line_key] = None               
                if log_line_key == 'bitstream_sim_status':
                            data[log_line_key] = None
        start_print_fmax=-1
        start_print_stats=-1
        start_pb_type_usage=-1
        synth_line=-1
        blocks_of_type_clb=-1
        line_of_total_wirelength=-1
        fle_percentage=0
        clb_used_percent=0
        wirelength_percentage=0
        total_clbs=0
        total_fles=0
        sum_luts = 0
        sum_dffs = 0
        sum_dsps = 0
        sum_brams = 0
        fle_used = 0
        CLB = 0
        LUTs = 0
        #start looping from end index of log and check the index where Printing statistics. occured, store in start variable
        for i in range(len(lines) - 1, -1, -1):
            if "Final critical path delay" in lines[i]:
                start_print_fmax = i
                break
        for i in range(len(lines) - 1, -1, -1):
            if "Printing statistics." in lines[i]:
                start_print_stats = i
                break
        for i in range(len(lines) - 1, -1, -1):
            if "is synthesized" in lines[i]:
                synth_line = i
                break
        for i in range(len(lines) - 1, -1, -1):
            if "Pb types usage..." in lines[i]:
                start_pb_type_usage = i
                break
        for i in range(len(lines) - 1, -1, -1):
            if "blocks of type: clb" in lines[i]:
                blocks_of_type_clb = i
                break
        for i in range(len(lines) - 1, -1, -1):
            if "Total wirelength:" in lines[i]:
                line_of_total_wirelength = i
                break
            
        for line in lines[start_print_stats+1:synth_line]:
            # Looping through each key and keyword in the log_line_keys_map for this log file
            for log_line_key, log_line_keyword in log_line_keys_map.items():
                # Checking if the keyword is in the current line
                if log_line_keyword in line: 
                    # if log_line_key == 'total_luts':
                    #     LUTs = int(line.split(log_line_keyword)[1].strip().split()[0])
                    #     data[log_line_key] = LUTs
                    if log_line_key == 'Adder_Carry':
                        data[log_line_key]=int(line.split()[1])

                if log_line_key == 'dsp':
                    #the code splits the log line keyword by commas and loops through the resulting list of keywords.
                    dsp_keywords = log_line_keyword.split(',')
                    for dsp_keyword in dsp_keywords:
                        if dsp_keyword in line:
                            for var in line.split(dsp_keyword)[1].strip().split():
                            # Applying error - handling method
                                    try:
                                        sum_dsps = sum_dsps + int(var)
                                        data[log_line_key] = sum_dsps
                                    except ValueError:
                                        #If the conversion fails, the code stores the value "0" 
                                        data[log_line_key] = 0   
                elif log_line_key == 'registers':
                    dffs_keywords = log_line_keyword.split(',')
                    for dffs_keyword in dffs_keywords:
                        if dffs_keyword in line:
                            for var in line.split(dffs_keyword)[1].strip().split():
                            # Applying error - handling method
                                    try:
                                        sum_dffs = sum_dffs + int(var)
                                        data[log_line_key] = sum_dffs
                                    except ValueError:
                                        data[log_line_key] = 0
                elif log_line_key == 'brams':
                    brams_keywords = log_line_keyword.split(',')
                    for brams_keyword in brams_keywords:
                        if brams_keyword in line:
                            for var in line.split(brams_keyword)[1].strip().split():
                            # Applying error - handling method
                                    try:
                                        sum_brams = sum_brams + int(var)
                                        data[log_line_key] = sum_brams
                                    except ValueError:
                                        data[log_line_key] = 0
                elif log_line_key == 'total_luts':
                    luts_keywords = log_line_keyword.split(',')
                    for luts_keyword in luts_keywords:
                        if luts_keyword in line:
                            for var in line.split(luts_keyword)[1].strip().split():
                            # Applying error - handling method
                                    try:
                                        sum_luts = sum_luts + int(var)
                                        data[log_line_key] = sum_luts
                                    except ValueError:
                                        data[log_line_key] = 0
             
        for log_line_key, log_line_keyword in log_line_keys_map.items():
            if log_line_key == 'CLB':
                for line in lines:
                    if "Failed to find device which satisifies resource requirements required" in line:
                        CLB = int(line.split('(available')[0].split('clb:')[1].split(',')[0])
                        data[log_line_key] = CLB
                    elif "Pb types usage" in line:
                        for line in lines[start_pb_type_usage:]:
                            if "blocks of type: clb" in line:
                                CLB = int(line.split('blocks')[0])
                                data[log_line_key] = CLB
                                break
        ###########fle_percent/wirelength#############
        for line in lines[start_pb_type_usage+1:]:
            for log_line_key, log_line_keyword in log_line_keys_map.items():
                if log_line_keyword in line:
                    if log_line_key == 'FLE_Percentage_used':
                        fle_used=line.split()[2].strip()
        for line in lines[blocks_of_type_clb:]:
            if "blocks of type: clb" in line:
                total_clbs=line.split(log_line_keyword)[0].strip().split()[0]
                total_fles=8*int(total_clbs) # 100 * (#fle_wrapper) / (8 * #clb). 
            for log_line_key, log_line_keyword in log_line_keys_map.items():
                if total_clbs == 0:
                    fle_percentage=None
                else:
                    fle_percentage=100*int(fle_used)/int(total_fles)
                if log_line_key == 'FLE_Percentage_used':
                    data[log_line_key] = fle_percentage
            for log_line_key, log_line_keyword in log_line_keys_map.items():
                if total_clbs == 0:
                    clb_used_percent=None
                else:
                    clb_used_percent=(CLB/int(total_clbs))*100
                if log_line_key == 'CLB_percentage_used':
                    data[log_line_key] = clb_used_percent
        # parsing the percentage of metal used from raptor.log 
        for i in range(len(lines) - 1, -1, -1):
            if "Total tracks in x-direction:" in lines[i]:
                line_of_total_track_x = i
                y_directed_channel=lines[line_of_total_track_x-2].strip().split()[0]
                break
        for i in range(len(lines) - 1, -1, -1):
            if "Y - Directed channels:" in lines[i]:
                line_of_total_track_y = i
                x_directed_channel=lines[line_of_total_track_y-1].strip().split()[0]
                break
        for line in lines[line_of_total_wirelength:]:
            if "Total wirelength:" in line:
                total_wirelength=line.split()[2].split(",")[0]  
            if "Total tracks in x-direction:" in line:
                x_direction=line.split()[4].split(",")[0]
                y_direction=line.split()[7]
                total_available_wirelength=int(x_direction)*(int(y_directed_channel)+1) + int(y_direction)*(int(x_directed_channel)+1)              # Total available wirelength will be 720 * (10 + 1) + 1760 * (8 + 1)
                wirelength_percentage=100*int(total_wirelength)/int(total_available_wirelength)    #%metal used will be 100 * total_wirelength / total_available.
        for log_line_key, log_line_keyword in log_line_keys_map.items():
            if log_line_key == 'Wirelength_Percentage_used':
                if wirelength_percentage == 0:
                    data[log_line_key] = None
                else:
                    data[log_line_key] = wirelength_percentage
        #################################################        
        
        fmax_clock_one=0
        for line in lines[start_print_fmax:]:
            for log_line_key, log_line_keyword in log_line_keys_map.items():
                # Checking if the keyword is in the current line
                if log_line_keyword in line:   
                    # Checking the file name and updating the value of the log line key accordingly
                    if log_line_key == 'fmax_clock1':
                        data[log_line_key] = float(line.split(log_line_keyword)[1].strip().split()[0])
                        fmax_clock_one=float(line.split(log_line_keyword)[1].strip().split()[0])  
                    if log_line_key == 'wns_clock1':
                        data[log_line_key] = float(line.split(log_line_keyword)[1].strip().split()[0])
                    if log_line_key == 'tns':
                        data[log_line_key] = float(line.split(log_line_keyword)[1].strip().split()[0])

                if log_line_key == "LUT_CLB_ratio":
                    if log_line_keyword == "LUT/CLB":
                        if CLB == 0:
                            luts_clbs_ratio=None
                        else:    
                            luts_clbs_ratio=LUTs/CLB
                        data[log_line_key]=luts_clbs_ratio

        fmax_list=[]
        indices = []
        for log_line_key, log_line_keyword in log_line_keys_map.items():
            if log_line_key == 'total_power':
                data[log_line_key] = None
            if log_line_key == 'dynamic_power':
                data[log_line_key] = None
            if log_line_key == 'static_power':
                data[log_line_key] = None

            total_no_of_slacks,clock_names,wns_values=clock_and_wns()
            if total_no_of_slacks > 1:
                for slacks in range(total_no_of_slacks):
                    if log_line_key == 'wns_clock'+str(slacks+1):
                        if total_no_of_slacks > 1:
                            data[log_line_key]=float(wns_values[slacks])

                    if total_no_of_slacks > 1:
                        file_name = os.path.join(os.getcwd(), "*.sdc")
                        sdc_file_path = glob.glob(file_name)
                        clock_name = clock_names[slacks]
                        single_clock_design=False
                        if not sdc_file_path:
                            pass
                        else:
                            clock_period,clock_name_returned = find_period_in_sdc(sdc_file_path[0], clock_name,single_clock_design)
                            if clock_period is not None:          # Fmax = 1 / (Clock Period - WNS)
                                fmax_clock=1/(float(clock_period)-float(wns_values[slacks]))
                                freq = round(fmax_clock * 1000, 2)
                                if log_line_key == 'fmax_clock'+str(slacks+1):
                                    data[log_line_key]=freq
                                    fmax_list.append(freq)
                                target_f=1/clock_period
                                target_freq=round(target_f * 1000, 2)
                                if log_line_key == 'target_freq_clock'+str(slacks+1):
                                    data[log_line_key]=target_freq
                            else:
                                print(f"No matching clock_period of {clock_name_returned} found for keyword '{clock_name}'")
                    if total_no_of_slacks > 1:
                        clocks_after_paths = find_clock_after_path()
                        indices = []
                        clk_index=0

                        for word in clocks_after_paths:
                            if word in clock_names:
                                llvl_count,returned_clock_name = get_llvl("combinational delay")
                                if returned_clock_name in clock_names:
                                    clk_index = clock_names.index(returned_clock_name)
                                else:
                                    clk_index = 0
                            if log_line_key == 'logic_level_clock'+str(clk_index+1):
                                data[log_line_key] = int(llvl_count)
                            else:
                                indices.append(None)
            else:
                file_name = os.path.join(os.getcwd(), "*.sdc")
                sdc_file_path = glob.glob(file_name)
                clock_name = "dummy_clock_name"
                single_clock_design=True
                if not sdc_file_path:
                    pass
                else:
                    clock_period,clock_name_returned = find_period_in_sdc(sdc_file_path[0], clock_name,single_clock_design)
                    target_f=1/clock_period
                    target_freq=round(target_f * 1000, 2)
                    if log_line_key == 'target_freq_clock1':
                        data[log_line_key]=target_freq

                llvl_count,returned_clock_name = get_llvl("combinational delay")
                if log_line_key == 'logic_level_clock1':
                    data[log_line_key] = int(llvl_count)

            if log_line_key == "fmax_geomean":
                if not fmax_list:
                    data[log_line_key]=fmax_clock_one
                else:
                    # Calculate the product of all frequencies
                    product = 1
                    for frequency in fmax_list:
                        product *= frequency

                    # Calculate the geometric mean
                    geometric_mean = math.pow(product, 1 / len(fmax_list))
                    data[log_line_key]=round(geometric_mean * 1, 2)
                
##failure_type       
        for log_line_key, log_line_keyword in log_line_keys_map.items():
            if log_line_key == 'failure_type':
                for line in lines:
                    if "synthesis failed" in line:
                        data[log_line_key] = "SYN"
                    elif "packing failed" in line:
                        data[log_line_key] = "PAC"
                    elif "placement failed" in line:
                        data[log_line_key] = "PLC"
                    elif "routing failed" in line:
                        data[log_line_key] = "RTE"
                    elif "timing analysis failed" in line:
                        data[log_line_key] = "TMN"
                    elif "power analysis failed" in line:
                        data[log_line_key] = "PWR"
                    elif "bitstream generation failed" in line:
                        data[log_line_key] = "BIT"
                    elif "Simulation Failed" in line:
                        data[log_line_key] = "SIM"
                    elif "Error-" in line:
                        data[log_line_key] = "SIM"

    
#Pass message for negative test (Delete afterwards when async set reset support added)
        # for line in lines:
        #         if 'Generic DFFs. Abort Synthesis.' in line:
        #             for log_line_key, log_line_keyword in log_line_keys_map.items():
        #                 if log_line_key == 'status':
        #                     data[log_line_key] = 'Pass'
        #                 if log_line_key == 'error_msg':
        #                     data[log_line_key] = None
        #                 if log_line_key == 'failure_type':
        #                     data[log_line_key] = None

    return data

def main():
    # Open the keywords file and read the keywords mapping
    with open('../../../keywords.json', 'r') as f:
        log_line_keys_map = json.load(f)
    data = parse_log_files(sys.argv[1],sys.argv[2],log_line_keys_map)
    with open('CGA_Result.json', 'w') as f:
        json.dump(data, f, indent=4)

if __name__ == '__main__':
    print ("parser.py is being run directly")
    main()
else: 
    print ("parser.py is being imported")
    main()
