import os
import glob
import random
import json
import itertools
from pathlib import Path

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
    return direc,design_info,design_top

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

def create_port_list(myDict,design_infor,conf,include_bencmarks):

    check_dir(CV_ROOT+"/random_test_generator_v1/misc/RD_Generator/")
    
    files = glob.glob(CV_ROOT+"/random_test_generator_v1/misc/RD_Generator/design*")
    design_no = []
    if not glob.glob(CV_ROOT+"/random_test_generator_v1/misc/RD_Generator/design*"):
        os.mkdir(CV_ROOT+"/random_test_generator_v1/misc/RD_Generator/design1")
        path=os.path.join(CV_ROOT+"/random_test_generator_v1/misc/RD_Generator/design1")
        path_for_config=path.split("/")[-1]
    else:
        for dir in files:
            dir_split=dir.split("gn")[-1]
            design_no.append(int(dir_split))
        new_dir=max(design_no)+1
        path = os.path.join(CV_ROOT,"random_test_generator_v1/misc/RD_Generator/","design"+str(new_dir))
        os.mkdir(path)
        path_for_config=path.split("/")[-1]

    inp = "";out="";input_dec="";out_dec="";wire="";wire_dec="";module_instance="";inc_bench="";module_instance_dec="";input_dec="";module_inst="";reg_dec="";top_wire_dec="";assign_in="";out_o="";out_i="";sign_o="";assign_out=""
    for n in range(channel):
        inp = inp+"d_in"+str(n)+", "
        input_dec=input_dec+"\tinput "+"[WIDTH-1:0] "+"d_in"+str(n) +"; "+"\n" 
        out = out+"d_out"+str(n)+", "
        out_dec=out_dec+"\toutput "+"[WIDTH-1:0] "+"d_out"+str(n)+"; "+"\n" 
    port_list = inp+out+"clk, rst"
    port_list_dec = "\n\tinput clk;\n\tinput rst;\n"+input_dec+out_dec
    for i in range(channel):
        for j in range(depth-1):
            wire_dec=wire_dec+"\twire "+"[WIDTH-1:0] " + "wire_d"+str(i)+"_"+str(j)+";\n"
    wire_dec = "\n"+wire_dec
    
    for i in include_bencmarks:
        inc_bench = inc_bench+"// `include "+'"'+i+".v"+'"'+"\n"

    for i in range(channel):
        reg_dec=reg_dec+"\treg "+"[WIDTH-1:0] "+"d_in"+str(i)+";\n"
    reg_dec = "\n"+reg_dec

    for i in range(channel):
        top_wire_dec=top_wire_dec+"\twire "+"[WIDTH-1:0] " + "d_out"+str(i)+";\n"
    top_wire_dec = top_wire_dec

    first_assign_in="\talways @ (posedge clk) begin\n\t\td_in0 <= tmp[WIDTH-1:0];\n"
    for j in range(channel-1):
        assign_in=assign_in+"\t\td_in"+str(j+1)+" <= tmp[(WIDTH*"+str(j+2)+")-1:WIDTH*"+str(j+1)+"];\n"

    for k in range(channel):
        out_i=out_i+".d_in"+str(k)+"(d_in"+str(k)+"),"
        out_o=out_o+".d_out"+str(k)+"(d_out"+str(k)+"),"
    out_portt=out_i
    out_porttt=out_o

    for i in range(channel):
        sign_o=sign_o+"d_out"+str(i)+"^"
    sign_o=sign_o[:-1]
    assign_ou=sign_o
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
            if (i>8):
                module_instance_dec = "\t"+design_infor[myDict[i][j]]+" #(.WIDTH(WIDTH)) "+myDict[i][j]+"_instance"+str(i+1)+"0"+str(i)+str(j)+"(.data_in("+in_port+"),.data_out("+out_port+"),.clk(clk),.rst(rst));"
            else:
                module_instance_dec = "\t"+design_infor[myDict[i][j]]+" #(.WIDTH(WIDTH)) "+myDict[i][j]+"_instance"+str(i+1)+str(i)+str(j)+"(.data_in("+in_port+"),.data_out("+out_port+"),.clk(clk),.rst(rst));"
            src_path = CV_ROOT+"/random_test_generator_v1/Design_Library/"+myDict[i][j]+"/rtl"
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

    with open(path+"/"+design_name+"_top.v",'w+') as verilog_out_file:
        verilog_out_file.write(inc_bench)
        verilog_out_file.write("\nmodule "+design_name +"_top #(parameter WIDTH="+str(width)+",CHANNEL="+str(channel)+") (clk, rst, in, out);\n\n\tlocalparam OUT_BUS=CHANNEL*WIDTH;\n\tinput clk,rst;\n\tinput [WIDTH-1:0] in;\n\toutput [WIDTH-1:0] out;\n")
        verilog_out_file.write(reg_dec)
        verilog_out_file.write(top_wire_dec)
        verilog_out_file.write("\n\treg [OUT_BUS-1:0] tmp;\n\n\talways @ (posedge clk or posedge rst) begin\n\t\tif (rst)\n\t\t\ttmp <= 0;\n\t\telse\n\t\t\ttmp <= {tmp[OUT_BUS-(WIDTH-1):0],in};\n\tend\n\n")
        verilog_out_file.write(first_assign_in)
        verilog_out_file.write(assign_in)
        verilog_out_file.write("\tend\n")
        verilog_out_file.write("\n\t"+design_name+" #(.WIDTH(WIDTH)) "+design_name+"_inst("+out_portt+out_porttt+".clk(clk),.rst(rst));")
        verilog_out_file.write("\n\n\t"+"assign out = "+assign_ou+";")
        verilog_out_file.write(end_mod+"\n\n")
        verilog_out_file.write("module "+design_name +" #(parameter WIDTH="+str(width)+") ("+port_list+");")
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

CV_ROOT=os.getcwd()
def run_test_gen(tool,JSON_data):
    global conf
    channel = read_channel(JSON_data)

    depth = read_depth(JSON_data)

    width,design_name,conf = read_width(JSON_data) 

    global design_infor, design_top
    benchmarks,design_infor,design_top = read_benchamrks(JSON_data)
    include_bencmarks = benchmarks
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
    create_port_list(myDict,design_infor,conf,include_bencmarks)
    print("\tRun Successfully")
