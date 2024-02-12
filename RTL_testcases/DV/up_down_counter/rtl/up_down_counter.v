`include "clb_defines.v"


module up_down_counter(
    input wire clock0,
    input wire reset,
    input wire dir, // 0 for up counting and 1 for down counting
    `ifdef LOAD_FUNCTION
        input wire load,
        input wire [`COUNTER_WIDTH - 1:0] counter_input,
    `endif
    output wire [`COUNTER_WIDTH - 1:0] counter_output
);
    reg [`COUNTER_WIDTH - 1:0] counter_data;
    assign counter_output = counter_data;

    always @(posedge clock0 or posedge reset) begin
        if(reset)begin
            counter_data <= {`COUNTER_WIDTH{1'b0}};
        end else begin
            
            `ifdef LOAD_FUNCTION
                if(load) begin
                    counter_data <= counter_input;
                end else begin
                    if(dir == 1)begin counter_data <= counter_data - 1; end
                    else if(dir == 0)begin counter_data <= counter_data + 1; end
                end
            `else 
                if(dir == 1)begin counter_data <= counter_data - 1; end
                else if(dir == 0)begin counter_data <= counter_data + 1; end
            `endif
        end
    end

endmodule
