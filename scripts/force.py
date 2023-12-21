import xml.etree.ElementTree as ET
import sys
import os.path

design_name= sys.argv[1]
netlist="SRC"

PinMapping =  f"../{design_name}/run_1/synth_1_1/impl_1_1_1/bitstream/PinMapping.xml"
check_pin_mapping = os.path.isfile(PinMapping)

pf = open(f"../{design_name}/PinMapping.v", 'w')
if check_pin_mapping:
    tree = ET.parse(PinMapping)
    root = tree.getroot()
    for child in root.iter('io'):
        if (child.attrib['dir'] == 'input'):
            if(netlist == 'SRC'):
                pf.write(f" assign {child.attrib['name']} = {child.attrib['net']};\n")
            else:
                pf.write(f" assign {child.attrib['name']} = {child.attrib['net']};\n")
        elif (child.attrib['dir'] == 'output'):
            if(netlist == 'SRC'):
                pf.write(f" assign {child.attrib['net']} = {child.attrib['name']};\n")
            else:
                pf.write(f" assign {child.attrib['net']} = {child.attrib['name']};\n")
   
else:
    pf.write(f"// PinMapping.xml is not generated for {design_name}")
pf.close()

output_file = open("../../bitstream_text.txt", "w")

file_path=(f'../{design_name}/run_1/synth_1_1/impl_1_1_1/bitstream/fabric_bitstream.xml')
check_xml_bitstream = os.path.isfile(file_path)

if check_xml_bitstream:
    with open(f"../{design_name}/run_1/synth_1_1/impl_1_1_1/bitstream/fabric_bitstream.xml",'r') as f:
        for line in f:
            if "path=" in line:
                path=line.split('"')[5]
                value=line.split('"')[3]
                fpga_top="force "+path+" = "+value+";\n"
                fpga_inst = fpga_top.replace("fpga_top","U0_formal_verification")
                output_file.write(fpga_inst)
else:
    fpga_inst=f"// xml bitsteam is not generated for {design_name} design"
    output_file.write(fpga_inst)
output_file.close()