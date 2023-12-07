## Random Design Generator
This repo contains the python script for random test generator, which can generate random designs providing the number of channels, depth and width to the script using the designs in the library/directory. These inputs are provided using json file.

You can add number of channels, depth of channel, width and designs and their top modules in this random_generator.json file. random_generator.json is available in the config folder.

To run this file you have to clone random testcase generator repo and put your terminal at Compiler_Validation and run the command "python3 //directory to run_cv.py// -T random_test_generator --json configs/test_generator.json" and script will create the verilog file for the designs and dump the output file in misc folder.

### Structure of the Repo

Random design generator contains following files

    Config file containing user input in *.json format.
    Design Library: contains list of dummy designs to test the flow
    cv_run.py script to control the compiler validation flow
    random_design_gen.py script to generate random rtl designs based on user input
    final generated design is stored in misc folder

Random design generator creates misc folder where it dumps the output rtl file.
