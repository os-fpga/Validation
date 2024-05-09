module GJC11 (
    input  wire clock0,
    
    input  wire data_in_P,
    input  wire data_in_N,

    input  wire data_push_P,
    input  wire data_push_N,

    output wire data_out_P,
    output wire data_out_N
    
);

    parameter SHIFT_REG_WIDHT = 64;

    wire data_in, data_out, data_push;
    reg push_new, push_prv;
    reg  shift_reg_enable;
    wire [SHIFT_REG_WIDHT:0] shift_reg_chain;

    // Input differential buffer
    I_BUF_DS DATA_INPUT_BUFFER (.I_P(data_in_P), .I_N(data_in_N), .EN(1), .O(data_in));
    I_BUF_DS DATA_PUSH_BUFFER  (.I_P(data_push_P), .I_N(data_push_N), .EN(1), .O(data_push));

    // Output differential buffer
    O_BUF_DS DATA_OUT_BUFFER (.I(data_out), .O_P(data_out_P), .O_N(data_out_N));


    assign shift_reg_chain[0] = data_in;
    assign data_out = shift_reg_chain[SHIFT_REG_WIDHT];

    // chain of flip flops creating a shift register
    genvar ff_number;
    for(ff_number = 0; ff_number < SHIFT_REG_WIDHT; ff_number = ff_number + 1)begin
        custom_dff shift_reg_ff (.D(shift_reg_chain[ff_number]), .E(shift_reg_enable), .C(clock0), .Q(shift_reg_chain[ff_number + 1]));
    end
    
    always @(negedge clock0) begin
        push_new <= data_push;
        push_prv <= push_new;
        // when posedge of data_push signal, data_in is inserted into the shift register
        if({push_prv,push_new} == 2'b01)begin
            shift_reg_enable <= 1;
        end else begin
            shift_reg_enable <= 0;
        end
    end

    
endmodule


module custom_dff (
    input wire D,
    input wire E,
    input wire C,
    output reg Q
);
    always @(posedge C) begin
        if(E) Q <= D;
    end
endmodule