`include "counter.v"
module counter_tb;
reg Clk =0;
reg rst =0;
wire [3:0]Q;
counter uut(Q, Clk, rst);
always #5 Clk = ~Clk;
initial begin
    $monitor("Time=%0t | Q=%b | Decimal=%0d", $time, Q, Q);
    rst = 0;
    #10 rst = 1;
    #1000 $finish;
end
endmodule
