// queue.v

// queue with first-in first-out operation. 

module queue
#(parameter data_width = 4,  // number of bits in each data
            address_width = 4,  // total addresses = 2^4
            max_data = 2**address_width // max_data = total_addresses
)
(
    input wire clk, reset,
    input wire read_cmd, write_cmd, // read and write command 
    input wire [data_width-1:0] write_data,  // write data to FIFO
    output reg [data_width-1:0] read_data,  // read data from FIFO
    output wire full,  // no space to write in FIFO
    output wire empty // nothing to read from FIFO
);

reg [data_width-1:0] queue_reg [max_data-1:0];
reg [address_width-1:0] front_reg, front_next; // pointer-front is for reading
reg [address_width-1:0] rear_reg, rear_next; // pointer-rear is for writing
reg full_reg, full_next;
reg empty_reg, empty_next;


assign full = full_reg;
assign empty = empty_reg;

wire write_enable; // enable if queue is not full

assign write_enable = write_cmd & ~full_reg; 

always @(posedge clk) begin
    // if queue_reg is full, then data will not be written
    if (write_enable)
        queue_reg[rear_reg] <= write_data; 
    if (read_cmd)
        read_data <= queue_reg[front_reg];
end

// status of the queue and location of pointers i.e. front and rear
always @(posedge clk, posedge reset) begin
    if (reset) begin
        empty_reg <= 1'b1;  // empty : nothing to read
        full_reg <= 1'b0;  // not full : data can be written 
        front_reg <= 0;
        rear_reg <= 0;
    end
    else begin
        front_reg <= front_next;
        rear_reg <= rear_next;
        full_reg <= full_next;
        empty_reg <= empty_next;
    end
end

// read and write operation
always @* begin
    front_next = front_reg;
    rear_next = rear_reg;
    full_next = full_reg;
    empty_next = empty_reg;

    // no operation for {write_cmd, read_cmd} = 00 
     
     // only read operation
    if({write_cmd, read_cmd} == 2'b01) begin // write = 0, read = 1
        if(~empty_reg) begin // not empty
            full_next = 1'b0; // not full as data is read
            front_next = front_reg + 1;
            if (front_next  == rear_reg) // empty
                empty_next = 1'b1; 
        end
    end
     // only write operation
    else if ({write_cmd, read_cmd} == 2'b10) begin // write = 1, read = 0 
        if(~full_reg) begin // not full
            empty_next = 1'b0;
            rear_next = rear_reg + 1;
            if(rear_next == front_reg)
                full_next = 1'b1;
        end
    end
     
     // both read and write operation
    else if  ({write_cmd, read_cmd} == 2'b11) begin // write = 1, read = 1 
        front_next = front_reg + 1;
        rear_next = rear_next + 1;
    end
end

endmodule 
