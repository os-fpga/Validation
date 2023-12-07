
module bidirec_intf (clk, reset, outb) ;
    input clk ; 
    output outb ; 
    input reset ; 
    (* src="/nfs_scratch/zafar/FPGA_PRIMITIVE_TEST_CASE/IO_BUFS/bidirec_intf.sv:31" *) wire Ta_in ; 
    (* src="/nfs_scratch/zafar/FPGA_PRIMITIVE_TEST_CASE/IO_BUFS/bidirec_intf.sv:32" *) wire Tb_in ; 
    (* src="/nfs_scratch/zafar/FPGA_PRIMITIVE_TEST_CASE/IO_BUFS/bidirec_intf.sv:4", src="/nfs_scratch/zafar/FPGA_PRIMITIVE_TEST_CASE/IO_BUFS/bidirec_intf.sv:4" *) wire clk ; 
    (* src="/nfs_scratch/zafar/FPGA_PRIMITIVE_TEST_CASE/IO_BUFS/bidirec_intf.sv:24" *) wire in_a_in ; 
    (* src="/nfs_scratch/zafar/FPGA_PRIMITIVE_TEST_CASE/IO_BUFS/bidirec_intf.sv:25" *) wire in_b_in ; 
    (* src="/nfs_scratch/zafar/FPGA_PRIMITIVE_TEST_CASE/IO_BUFS/bidirec_intf.sv:28" *) wire outa_in ; 
    (* src="/nfs_scratch/zafar/FPGA_PRIMITIVE_TEST_CASE/IO_BUFS/bidirec_intf.sv:18", src="/nfs_scratch/zafar/FPGA_PRIMITIVE_TEST_CASE/IO_BUFS/bidirec_intf.sv:18" *) wire outb ; 
    (* src="/nfs_scratch/zafar/FPGA_PRIMITIVE_TEST_CASE/IO_BUFS/bidirec_intf.sv:29" *) wire outb_in ; 
    (* src="/nfs_scratch/zafar/FPGA_PRIMITIVE_TEST_CASE/IO_BUFS/bidirec_intf.sv:5", src="/nfs_scratch/zafar/FPGA_PRIMITIVE_TEST_CASE/IO_BUFS/bidirec_intf.sv:5" *) wire reset ; 
    assign outb = 1'bx ; 
endmodule


