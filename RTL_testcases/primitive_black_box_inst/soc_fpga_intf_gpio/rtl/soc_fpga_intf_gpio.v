module soc_fpga_intf_gpio (
    
    output [39:0] GPIO_O,
    input  [39:0] GPIO_I,
    input  [39:0] GPIO_OEN,
    input         GPIO_CLK,
    input         GPIO_RST_N    

); 

SOC_FPGA_INTF_GPIO inst (
    .GPIO_O(GPIO_O),
    .GPIO_I(GPIO_I),
    .GPIO_OEN(GPIO_OEN),
    .GPIO_CLK(GPIO_CLK),
    .GPIO_RST_N(GPIO_RST_N)
);

endmodule
