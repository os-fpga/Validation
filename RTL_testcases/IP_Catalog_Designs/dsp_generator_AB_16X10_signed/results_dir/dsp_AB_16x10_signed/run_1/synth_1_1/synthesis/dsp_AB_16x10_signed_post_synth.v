/* Generated by Yosys 0.18+10 (git sha1 9ae216287, gcc 11.2.1 -fPIC -Os) */

module dsp_AB_16x10_signed(a, b, clk, reset, z);
  input [15:0] a;
  input [9:0] b;
  input clk;
  input reset;
  output [25:0] z;
  (* unused_bits = "0 1 2 3 4 5 6 7 8 9 10 11" *)
  wire [11:0] _0_;
  (* src = "/nfs_scratch/scratch/litex/sarmad_salman/practice/ep4/Validation/RTL_testcases/IP_Catalog_Designs/dsp/dsp_generator_AB_16X10_signed/results_dir/./dsp_AB_16x10_signed/run_1/IPs/rapidsilicon/ip/dsp_generator/v1_0/dsp_AB_16x10_signed/src/dsp_AB_16x10_signed_v1_0.v:29.26-29.27" *)
  (* src = "/nfs_scratch/scratch/litex/sarmad_salman/practice/ep4/Validation/RTL_testcases/IP_Catalog_Designs/dsp/dsp_generator_AB_16X10_signed/results_dir/./dsp_AB_16x10_signed/run_1/IPs/rapidsilicon/ip/dsp_generator/v1_0/dsp_AB_16x10_signed/src/dsp_AB_16x10_signed_v1_0.v:29.26-29.27" *)
  wire [15:0] a;
  (* src = "/nfs_scratch/scratch/litex/sarmad_salman/practice/ep4/Validation/RTL_testcases/IP_Catalog_Designs/dsp/dsp_generator_AB_16X10_signed/results_dir/./dsp_AB_16x10_signed/run_1/IPs/rapidsilicon/ip/dsp_generator/v1_0/dsp_AB_16x10_signed/src/dsp_AB_16x10_signed_v1_0.v:30.26-30.27" *)
  (* src = "/nfs_scratch/scratch/litex/sarmad_salman/practice/ep4/Validation/RTL_testcases/IP_Catalog_Designs/dsp/dsp_generator_AB_16X10_signed/results_dir/./dsp_AB_16x10_signed/run_1/IPs/rapidsilicon/ip/dsp_generator/v1_0/dsp_AB_16x10_signed/src/dsp_AB_16x10_signed_v1_0.v:30.26-30.27" *)
  wire [9:0] b;
  (* src = "/nfs_scratch/scratch/litex/sarmad_salman/practice/ep4/Validation/RTL_testcases/IP_Catalog_Designs/dsp/dsp_generator_AB_16X10_signed/results_dir/./dsp_AB_16x10_signed/run_1/IPs/rapidsilicon/ip/dsp_generator/v1_0/dsp_AB_16x10_signed/src/dsp_AB_16x10_signed_v1_0.v:31.26-31.29" *)
  (* src = "/nfs_scratch/scratch/litex/sarmad_salman/practice/ep4/Validation/RTL_testcases/IP_Catalog_Designs/dsp/dsp_generator_AB_16X10_signed/results_dir/./dsp_AB_16x10_signed/run_1/IPs/rapidsilicon/ip/dsp_generator/v1_0/dsp_AB_16x10_signed/src/dsp_AB_16x10_signed_v1_0.v:31.26-31.29" *)
  wire clk;
  (* src = "/nfs_scratch/scratch/litex/sarmad_salman/practice/ep4/Validation/RTL_testcases/IP_Catalog_Designs/dsp/dsp_generator_AB_16X10_signed/results_dir/./dsp_AB_16x10_signed/run_1/IPs/rapidsilicon/ip/dsp_generator/v1_0/dsp_AB_16x10_signed/src/dsp_AB_16x10_signed_v1_0.v:32.26-32.31" *)
  (* src = "/nfs_scratch/scratch/litex/sarmad_salman/practice/ep4/Validation/RTL_testcases/IP_Catalog_Designs/dsp/dsp_generator_AB_16X10_signed/results_dir/./dsp_AB_16x10_signed/run_1/IPs/rapidsilicon/ip/dsp_generator/v1_0/dsp_AB_16x10_signed/src/dsp_AB_16x10_signed_v1_0.v:32.26-32.31" *)
  wire reset;
  (* src = "/nfs_scratch/scratch/litex/sarmad_salman/practice/ep4/Validation/RTL_testcases/IP_Catalog_Designs/dsp/dsp_generator_AB_16X10_signed/results_dir/./dsp_AB_16x10_signed/run_1/IPs/rapidsilicon/ip/dsp_generator/v1_0/dsp_AB_16x10_signed/src/dsp_AB_16x10_signed_v1_0.v:33.26-33.27" *)
  (* src = "/nfs_scratch/scratch/litex/sarmad_salman/practice/ep4/Validation/RTL_testcases/IP_Catalog_Designs/dsp/dsp_generator_AB_16X10_signed/results_dir/./dsp_AB_16x10_signed/run_1/IPs/rapidsilicon/ip/dsp_generator/v1_0/dsp_AB_16x10_signed/src/dsp_AB_16x10_signed_v1_0.v:33.26-33.27" *)
  wire [25:0] z;
  (* module_not_derived = 32'h00000001 *)
  (* src = "/nfs_scratch/scratch/litex/sarmad_salman/practice/ep4/Validation/RTL_testcases/IP_Catalog_Designs/dsp/dsp_generator_AB_16X10_signed/results_dir/./dsp_AB_16x10_signed/run_1/IPs/rapidsilicon/ip/dsp_generator/v1_0/dsp_AB_16x10_signed/src/dsp_AB_16x10_signed_v1_0.v:71.3-80.2" *)
  DSP38 #(
    .DSP_MODE("MULTIPLY"),
    .INPUT_REG_EN("TRUE"),
    .OUTPUT_REG_EN("TRUE")
  ) DSP38 (
    .A({ a[15], a[15], a[15], a[15], a }),
    .B({ b[9], b[9], b[9], b[9], b[9], b[9], b[9], b[9], b }),
    .CLK(clk),
    .FEEDBACK(3'h0),
    .RESET(reset),
    .UNSIGNED_A(1'h0),
    .UNSIGNED_B(1'h0),
    .Z({ _0_, z })
  );
endmodule