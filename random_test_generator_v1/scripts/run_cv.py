# from cga_defs import *
import argparse
import os
import subprocess
import shutil
import json
from pathlib import Path
import sys
from random_testcase_generator.random_gen import *

CV_ROOT=os.getcwd()
# try:
#   CV_ROOT = os.environ['CV_ROOT']
# except:
#   print("CV_ROOT is not defined, Please export CV_ROOT=<path to the Gap-Analysis directory>")
#   sys.exit()

exec(open(CV_ROOT+'/random_test_generator_v1/scripts/random_testcase_generator/random_gen.py').read())

parser = argparse.ArgumentParser()
#group = parser.add_mutually_exclusive_group(required=True)

parser.add_argument("-T", "--tool",
		   type=str,
		   choices=["random_test_generator"],
		   help="Specify which tool to run",
		   required=True)
parser.add_argument("--json",
		    type=str,
		    help="Path for Tools Input file",
		    required=True)
args = parser.parse_args()



if (os.path.exists(CV_ROOT+"/random_test_generator_v1/"+args.json)):
  with open(CV_ROOT+"/random_test_generator_v1/"+args.json) as file:
    JSON_data = json.load(file)
else:
  #print(args.json)
  print("[ERROR]: <"+CV_ROOT+"/"+args.json+"> file does not exist")
  print("[INFO]: Default path for tool's JSON file is "+CV_ROOT+"/"+"configs/")
  sys.exit()

# try:
#   if (args.tool == "vivado"):
#     subprocess.Popen(["vivado", "-version"])
#   elif (args.tool == "quartus"):
#     subprocess.Popen(["quartus_sh", "--version"])
#   elif (args.tool == "quartus_pow"):
#     print_blue("Running Quartus Power Analyzer for power analysis")
#   elif (args.tool == "diamond"):
#     subprocess.Popen(["diamondc", "-version"])
#   elif (args.tool == "formality"):
#     subprocess.Popen(["fm_shell", "-version"])
# except:
#   print_red("%s has not been loaded" %args.tool)
#   print("To load tool please use the following command:")
#   if (args.tool == "vivado"):
#     print_cyan("load_vivado")
#   elif (args.tool == "quartus"):
#     print_cyan("load_quartus_std_v20.1.1")
#   elif (args.tool == "quartus_pow"):
#     print_cyan("load_quartus_std_v20.1.1")
#   elif (args.tool == "diamond"):
#     print_cyan("load_diamond")
#   elif (args.tool == "formality"):
#     print_cyan("load_formality_vS-2021.06-SP2")
#   sys.exit()


TOOL_CONF_TEMP = CV_ROOT+"/random_test_generator_new_version/"+args.json

if args.tool=="random_test_generator":
  run_test_gen(args.tool,JSON_data)
