import sys
import os

def inc_upate(fabric_netlist_path,prefix,a):
    with open(fabric_netlist_path, 'r') as file:
        file_content = file.readlines()

    # Process each line
    for i in range(len(file_content)):
        if a in file_content[i]:
            fabric_netlist_cont = file_content[i].split('"')[1]
            new_fabric_netlist_path = os.path.join(prefix, fabric_netlist_cont)
            file_content[i] = a+'{}"\n'.format(new_fabric_netlist_path)

    with open(fabric_netlist_path, 'w') as file:
        file.writelines(file_content)

    print("File updated successfully.")

def insert_after_fpga_defines(file_path, new_content):
    try:
        with open(file_path, 'r') as file:
            lines = file.readlines()

        fpga_defines_index = -1
        for i, line in enumerate(lines):
            if 'fpga_defines' in line:
                fpga_defines_index = i
                break

        if fpga_defines_index != -1:
            lines.insert(fpga_defines_index + 1, new_content + '\n')

            with open(file_path, 'w') as file:
                file.writelines(lines)

            print("New content inserted after 'fpga_defines'.")
        else:
            print("No 'fpga_defines' found in the file.")

    except FileNotFoundError:
        print(f"File '{file_path}' not found.")

def rename_p(file_path,prefix_to_remove,change):

    with open(file_path, 'r') as file:
        file_content = file.readlines()

    for i in range(len(file_content)):
        if prefix_to_remove in file_content[i]:
            file_content[i] = file_content[i].replace(prefix_to_remove, change)

    with open(file_path, 'w') as file:
        file.writelines(file_content)

    print("File updated successfully.")

def remove_iopadmap(file_path):
    try:
        with open(file_path, 'r') as file:
            lines = file.readlines()

        with open(file_path, 'w') as file:
            for line in lines:
                modified_line = line.replace("$iopadmap$", "")
                file.write(modified_line)

        print("'$iopadmap$' removed from lines in the file.")
    except FileNotFoundError:
        print(f"File '{file_path}' not found.")
    
    # comment the always block
    with open(file_path, 'r') as file:
        lines = file.readlines()

    always_line = None
    end_line = None

    always_found = False

    for i, line in enumerate(lines, start=1):
        if not always_found and 'always@(negedge' in line:
            always_found = True
            always_line=i
        elif always_found:
            if 'end' in line:
                end_line=i
                break

    if always_line is not None and end_line is not None:
        for i in range(always_line - 1, end_line):
            lines[i] = "//" + lines[i]

    with open(file_path, 'w') as file:
        file.writelines(lines)


def insert_new_lines(file_path,line,new_line):
    with open(file_path, 'r') as file:
        file_content = file.readlines()

    try:
        index = file_content.index(line)
        file_content.insert(index + 1, new_line)
    except ValueError:
        print("Line not found in the file.")

    with open(file_path, 'w') as file:
        file.writelines(file_content)

    print("File updated successfully.")

def main():
    file_path = sys.argv[1]
    design_name=sys.argv[2]

    if file_path.endswith("fabric_"+design_name+"_formal_random_top_tb.v"):
        remove_iopadmap(file_path)
    elif file_path.endswith("fabric_"+design_name+"_top_formal_verification.v"):
        remove_iopadmap(file_path)
    elif file_path.endswith("fabric_netlists.v"):
        inc_upate(file_path,"BIT_SIM/","`include \"")
        rename_p(file_path,"BIT_SIM/./SRC/","SRC/")
        rename_p(file_path,"`include \"SRC/sc_verilog","// `include \"SRC/sc_verilog")
        rename_p(file_path,"rs_dsp.v","QL_DSP.v")
        rename_p(file_path,"rs_bram.v","QL_BRAM.v")
        insert_new_lines(file_path,"`include \"SRC/CustomModules/rs_ccff.v\"\n","`include \"SRC/CustomModules/ql_ioff.v\"\n")
        insert_new_lines(file_path,"`include \"SRC/CustomModules/ql_ioff.v\"\n","`include \"SRC/CustomModules/QL_IOFF_dti.v\"\n")
        insert_new_lines(file_path,"`include \"SRC/CustomModules/QL_IOFF_dti.v\"\n","`include \"SRC/CustomModules/QL_XOR_MUX2_dti.v\"\n")
        insert_new_lines(file_path,"`include \"SRC/CustomModules/ql_preio.v\"\n","`include \"SRC/CustomModules/RS_CCFF_dti.v\"\n")
        insert_new_lines(file_path,"`include \"SRC/CustomModules/gc_ff.v\"\n","`include \"SRC/CustomModules/ql_dsp_dti.v\"\n")
        insert_new_lines(file_path,"`include \"SRC/CustomModules/gc_ffn.v\"\n","`include \"SRC/CustomModules/QL_TDP36K_dti.v\"\n")

        new_content = '`include "SRC/CustomModules/bram/rtl/dti_dp_tm16ffcll_1024x18_t8bw2x_m_hc.v"\n\n`include "/cadlib/gemini/TSMC16NMFFC/library/std_cells/dti/7p5t/rev_220704/220704_dti_tm16ffc_90c_7p5t_stdcells_rev1p0p1_rapid_fe_views_svt/220704_dti_tm16ffc_90c_7p5t_stdcells_rev1p0p1_rapid/verilog/dti_tm16ffc_90c_7p5t_stdcells_rev1p0p0.v"\n`include "/cadlib/virgo/TSMC16NMFFC/library/std_cells/dti/7p5t/rev_181022/221018_dti_tm16ffc_90c_7p5t_stdcells_rev1p0p8_rapid_fe_views_lvt/221018_dti_tm16ffc_90c_7p5t_stdcells_rev1p0p8_rapid/verilog_lvt/dti_tm16ffc_lvt_90c_7p5t_stdcells_rev1p0p0.v"\n`include "/cadlib/virgo/TSMC16NMFFC/library/std_cells/dti/7p5t/rev_181022/221018_dti_tm16ffc_90c_7p5t_stdcells_rev1p0p8_rapid_fe_views_hvt/221018_dti_tm16ffc_90c_7p5t_stdcells_rev1p0p8_rapid/verilog_hvt/dti_tm16ffc_hvt_90c_7p5t_stdcells_rev1p0p0.v"'
        insert_after_fpga_defines(file_path, new_content)

if __name__ == "__main__":
    main()
