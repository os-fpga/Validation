module GJC10 (
    input  wire clock0,
    input  wire reset,
    input  wire push_button, // increment counter
    output wire led0,
    output wire led1,
    output wire led2,
    output wire led3
);
    wire push_button_debounce_in, push_button_debounce_out;
    wire reset_button_debounce_in, reset_button_debounce_out;
    reg increment_new, increment_prv;
    reg [3:0] led_counter;
    

    // output buffer
    O_BUF LED0_BUFFER(.I(led_counter[0]), .O(led0));
    O_BUF LED1_BUFFER(.I(led_counter[1]), .O(led1));
    O_BUF LED2_BUFFER(.I(led_counter[2]), .O(led2));
    O_BUF LED3_BUFFER(.I(led_counter[3]), .O(led3));
    
    // Input buffer for increment counter push button 
    I_BUF BUFFER_PUSH_BUTTON (.I(push_button), .EN(1'b1), .O(push_button_debounce_in));


    // Input buffer for reset push button 
    I_BUF BUFFER_RESET_BUTTON (.I(reset), .EN(1'b1), .O(reset_button_debounce_in));


    // debounce filter to remove high freq oscillations from button metal contacts
    btn_debounce_filter #(.DELAY_MS(1), .CLK_FREQ_MHZ(40)) DBN_FILTER_PUSH_BUTTON (.clk(clock0), .btn(push_button_debounce_in), .btn_debounced(push_button_debounce_out));


    // debounce filter to remove high freq oscillations from button metal contacts
    btn_debounce_filter #(.DELAY_MS(1), .CLK_FREQ_MHZ(40)) DBN_FILTER_RESET_BUTTON (.clk(clock0), .btn(reset_button_debounce_in), .btn_debounced(reset_button_debounce_out));


    always @(posedge clock0) begin
        if(reset_button_debounce_out) begin // active high synchronous reset
            led_counter <= 0;
        end else begin
            increment_new <= push_button_debounce_out;
            increment_prv <= increment_new;
            // if the change in push button signal is from low to high then
            // increment the counter
            if({increment_new, increment_prv} == 2'b10) begin
                led_counter <= led_counter + 1;
            end 
        end
    end

endmodule


module btn_debounce_filter #(
    parameter DELAY_MS = 250,     // debounce delay in milliseconds
    parameter CLK_FREQ_MHZ = 40   // input clock frequency in MHz
)(
    input wire clk,      // assuming Input clock 40MHz
    input wire btn,      // Push button input
    output reg btn_debounced // Debounced push button output
);

    // parameter DEBOUNCE_CYCLES = DELAY_MS * CLK_FREQ_MHZ * 10**3; // Adjust as necessary for your clock frequency
    parameter DEBOUNCE_CYCLES = 10; //for simulation purpose
    reg [31:0] debounce_count;
    reg btn_prev, btn_current;
    
    always @(posedge clk) begin
        // Shift in current button state
        btn_prev <= btn_current;
        btn_current <= btn;
        
        // If button state has changed
        if (btn_current != btn_prev) begin
            debounce_count <= 0;
        end else begin
            // If button state is stable, increment counter
            if (debounce_count < DEBOUNCE_CYCLES) begin
                debounce_count <= debounce_count + 1;
            end else begin
                // Set debounced output to current button state
                btn_debounced <= btn_current;
            end
        end
    end

endmodule
