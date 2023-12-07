// queue_top.v

// write the 'count' from 'modMCounter' to the queue.
// SW[0]    : read operation
// LEDR[0]  : queue empty
// SW[1]    : write operation
// LEDR [1] : queue full

// Test : 
// 1. Keep reset high, SW[1] low and SW[0] high till LEDR[0] glow, i.e.
// queue is empty now. 
// 2. Now, keep SW[1] high, SW[0] low, then bring reset to low. 
// Now count will start and will be stored in the queue. 
// 3. Bring the SW[1] to low again and see the count at 
// that time (as count will continue to inrease). 
// 4. Now, set SW[0] high, and it will start the count from 0, to the count which was
// displayed in step 3; and after that LEDR[0] will glow again.
// 5. Next, bring SW[0] to low and SW[1] to high, and let it run. 
// after 16 count (i.e. 2^address_width), the queue will be full and 
// LED[1] will glow. 

module queue_tb(
    reset,
    CLOCK_50,
    SW,
    LEDG,
    LEDR
);


input wire  reset;
input wire  CLOCK_50;
input wire  [1:0] SW;
output wire [3:0] LEDG;
output wire [17:0] LEDR;

wire    clk1s;
wire    [3:0] count;

assign  LEDR[17:14] = count[3:0];

// clock 1 sec
clockTick   unit_clkTick(
    .clk(CLOCK_50),
    .reset(reset),
    .clkPulse(clk1s));
    defparam    unit_clkTick.M = 50000000;
    defparam    unit_clkTick.N = 26;

// queue.v
queue   unit_queue(
    .clk(clk1s),
    .reset(reset),
    .read_cmd(SW[0]),
    .write_cmd(SW[1]),
    .write_data(count),
    .full(LEDR[1]),
    .empty(LEDR[0]),
    
    .read_data(LEDG));
    defparam    unit_queue.address_width = 4;
    defparam    unit_queue.data_width = 4;
    defparam    unit_queue.max_data = 16;

// mod-12 counter
modMCounter unit_counter(
    .clk(clk1s),
    .reset(reset),
    
    .count(count));
    defparam    unit_counter.M = 12;
    defparam    unit_counter.N = 4;


endmodule 
