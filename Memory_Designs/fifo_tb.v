`timescale 1ns/1ps

module fifo_tb;

reg clk;
reg reset;

reg write_en;
reg read_en;

reg [7:0] data_in;

wire [7:0] data_out;
wire full;
wire empty;

fifo uut(
    .clk(clk),
    .reset(reset),
    .write_en(write_en),
    .read_en(read_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
);

always #5 clk = ~clk;

initial
begin

    clk = 0;
    reset = 1;

    write_en = 0;
    read_en = 0;
    data_in = 0;

    #20;
    reset = 0;

    // Write 10
    data_in = 8'd10;
    write_en = 1;
    #10;

    // Write 20
    data_in = 8'd20;
    #10;

    // Write 30
    data_in = 8'd30;
    #10;

    write_en = 0;

    #20;

    // Read 10
    read_en = 1;
    #10;

    // Read 20
    #10;

    // Read 30
    #10;

    read_en = 0;

    #50;

    $stop;

end

endmodule