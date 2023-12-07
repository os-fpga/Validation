import os
import glob
import random
import json
import itertools

def check_dir(*args):
  for directory in args:
    if not (os.path.isdir(Path(directory))):
      os.makedirs(directory)
    else:
      print ("%s already exists" %directory)


def read_channel(JSON_data):
    global channel
    channel = JSON_data['GENERAL']['CHANNEL']
    if channel < 1:
        channel = 1
    return channel

def read_depth(JSON_data):
    global depth
    depth = JSON_data['GENERAL']['DEPTH']
    if depth < 2:
        depth = 2
    return depth

def read_width(JSON_data):
    global width, design_name
    width = JSON_data['GENERAL']['WIDTH']
    conf = JSON_data['GENERAL']['config_tcl']
    design_name = JSON_data['GENERAL']['DESIGN_NAME']
    return width,design_name,conf

def read_benchamrks(JSON_data):
    global clock
    direc = []; design_info={}
    for args in JSON_data['BENCHMARKS']:
        #bench = CV_ROOT+"/random_test_generator/"+JSON_data['BENCHMARKS'][args]['design']
        design_top = JSON_data['BENCHMARKS'][args]['design_top']
        direc.append(args)
        #set_params_t(bench)
        design_info[args] = design_top
        #design_info[args] = DESIGN_TOP
        #clock = JSON_data['BENCHMARKS'][args]['CLOCK_DATA']
    return direc,design_info

def find_string_in_file(filename, string_to_search, string_to_replace):
  new_string = ""
  with open(filename, 'r') as read_job:
    for line in read_job:
      if string_to_search in line:
        new_string = line.replace(string_to_search, string_to_replace).strip()
        return new_string
  return new_string


def set_params_t(DESIGN_CONF):
  global PROJECT_NAME, DESIGN_TOP, DESIGN_DIR, DOMAIN, CLOCK_COUNT
  PROJECT_NAME = find_string_in_file(DESIGN_CONF, "set ::env(PROJECT_NAME) ", "").strip('"')
  DESIGN_TOP = find_string_in_file(DESIGN_CONF, "set ::env(DESIGN_TOP) ", "").strip('"')
  DESIGN_DIR = find_string_in_file(DESIGN_CONF, "set ::env(DESIGN_DIR) ", "").strip('"')
  DOMAIN = find_string_in_file(DESIGN_CONF, "set ::env(DOMAIN) ", "").strip('"')
  CLOCK_COUNT = find_string_in_file(DESIGN_CONF, "set ::env(CLOCK_COUNT) ", "")

def create_port_list(myDict,design_infor,conf):

    check_dir(CV_ROOT+"/random_test_generator/misc/RD_Generator/")
    
    files = glob.glob(CV_ROOT+"/random_test_generator/misc/RD_Generator/design*")
    design_no = []
    if not glob.glob(CV_ROOT+"/random_test_generator/misc/RD_Generator/design*"):
        os.mkdir(CV_ROOT+"/random_test_generator/misc/RD_Generator/design1")
        path=os.path.join(CV_ROOT+"/random_test_generator/misc/RD_Generator/design1")
        path_for_config=path.split("/")[-1]
    else:
        for dir in files:
            dir_split=dir.split("gn")[-1]
            design_no.append(int(dir_split))
        new_dir=max(design_no)+1
        path = os.path.join(CV_ROOT,"random_test_generator/misc/RD_Generator/","design"+str(new_dir))
        os.mkdir(path)
        path_for_config=path.split("/")[-1]

    inp = "";out="";input_dec="";out_dec="";wire="";wire_dec="";module_instance="";module_instance_dec="";input_dec="";module_inst=""
    for n in range(channel):
        inp = inp+"d_in"+str(n)+", "
        input_dec=input_dec+"\tinput "+"[WIDTH-1:0] "+"d_in"+str(n) +"; "+"\n" #"+str(width-1)+"
        out = out+"d_out"+str(n)+", "
        out_dec=out_dec+"\toutput "+"[WIDTH-1:0] "+"d_out"+str(n)+"; "+"\n" #"+str(width-1)+"
    port_list = inp+out+"clk, rst"
    port_list_dec = "\n\tinput clk;\n\tinput rst;\n"+input_dec+out_dec
    for i in range(channel):
        for j in range(depth-1):
            wire_dec=wire_dec+"\twire "+"[WIDTH-1:0] " + "wire_d"+str(i)+"_"+str(j)+";\n" #+str(width-1)+
    wire_dec = "\n"+wire_dec
    
    for i in range(channel):
        for j in range(depth):
            if j == 0:
                in_port = "d_in"+str(i)
            else:
                in_port = "wire_d"+str(i)+"_"+str(j-1)
            if j==depth-1:
                out_port = "d_out"+str(i)
            else:
                out_port = "wire_d"+str(i)+"_"+str(j)
            module_instance_dec = "\t"+design_infor[myDict[i][j]]+" #(.WIDTH(WIDTH)) "+myDict[i][j]+"_instance"+str(i)+str(j)+"(.data_in("+in_port+"),.data_out("+out_port+"),.clk(clk),.rst(rst));"
            src_path = CV_ROOT+"/random_test_generator/Design_Library/"+myDict[i][j]+"/rtl"
            dst_path = path
            src_file = os.listdir(src_path)
            dst_file = os.listdir(dst_path)
            for f in src_file:
                design_file_path = src_path+"/"+ f
                shutil.copy(design_file_path,dst_path)
            if j == depth-1:
                module_inst=module_inst+"\n"+module_instance_dec+"\n"
            elif j == 0:
                module_inst=module_inst+"\n"+module_instance_dec+"            //channel "+str(i+1)
            else:
                module_inst=module_inst+"\n"+module_instance_dec
    end_mod = "\n\nendmodule"

    with open(path+"/"+design_name+".v",'w+') as verilog_out_file:
        verilog_out_file.write("module "+design_name +" #(parameter WIDTH = "+str(width)+")("+port_list+");")
        verilog_out_file.write(port_list_dec)
        verilog_out_file.write(wire_dec)
        verilog_out_file.write(module_inst)
        verilog_out_file.write(end_mod)
    if (conf == True):
        with open(path+"/"+"config.tcl",'w+') as config_file:
            config_file.write("set ::env(PROJECT_NAME) "+path_for_config+"\n")
            config_file.write("set ::env(DESIGN_TOP) "+design_name+"_top\n")
            config_file.write("set ::env(DESIGN_DIR) RTL_Benchmark/Verilog/random_test_cases/"+path_for_config+"\n")
            config_file.write("set ::env(TOP_VERILOG) RTL_Benchmark/Verilog/random_test_cases/"+path_for_config+"/"+design_name+".v"+"\n")
            config_file.write("set ::env(CLOCK_COUNT) 1\n")
            config_file.write("set ::env(DOMAIN) Random_test_cases\n")

def run_test_gen(tool,JSON_data):
    global conf
    channel = read_channel(JSON_data)

    depth = read_depth(JSON_data)

    width,design_name,conf = read_width(JSON_data)

    global design_infor
    benchmarks,design_infor = read_benchamrks(JSON_data)

    if depth>len(benchmarks):
        benchmarks = benchmarks*(round(depth/len(benchmarks))+1)

    global random_bench
    myDict = {}
    for i in range(channel):
        if (depth > 1):
            random_bench = random.sample(benchmarks,depth)
            myDict[i]=random_bench
        else:
            print("Depth should be greater than one...")
    create_port_list(myDict,design_infor,conf)
    print("\tRun Successfully")
