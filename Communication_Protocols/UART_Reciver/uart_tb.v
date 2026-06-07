`timescale 1ns/1ps

module uart_rx_tb;

reg clk;
reg reset;
reg rx;

wire [7:0] data_out;
wire rx_done;

uart_rx uut(
    .clk(clk),
    .reset(reset),
    .rx(rx),
    .data_out(data_out),
    .rx_done(rx_done)
);

always #5 clk = ~clk;

task send_uart_byte;
    input [7:0] data;
    integer i;
    begin
        rx = 1'b0;          // start bit
        #(10 * 10);

        for (i = 0; i < 8; i = i + 1) begin
            rx = data[i];   // LSB first
            #(10 * 10);
        end

        rx = 1'b1;          // stop bit
        #(10 * 10);
    end
endtask

initial begin
    clk = 0;
    reset = 1;
    rx = 1;

    #20;
    reset = 0;

    #20;
    send_uart_byte(8'b10101010);

    #300;

    $stop;
end

endmodule
