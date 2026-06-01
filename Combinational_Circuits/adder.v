module adder(x,y,S,Load,Clock);
input [3:0] x,y;
input Load,Clock;
output [3:0] S;
wire [3:0] PO;
shiftreg r1(SI,x,SO1,S,Clock,Load);
shiftreg r2 (1'b0,y,SO2,PO,Clock,Load);
serial_adder sa(SO1,SO2,SI,Clock,Load);
endmodule
