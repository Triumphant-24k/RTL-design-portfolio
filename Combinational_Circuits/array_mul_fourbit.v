module array_mul_fourbit(
    input  [3:0] A,
    input  [3:0] B,
    output [7:0] p);

    wire [3:0] pp0 = (A & {4{B[0]}});
    wire [3:0] pp1 = (A & {4{B[1]}});
    wire [3:0] pp2 = (A & {4{B[2]}});
    wire [3:0] pp3 = (A & {4{B[3]}});


    wire [3:0] sum1; 
    wire c_out1;
    RCA_4bit rca1(.A({1'b0, pp0[3:1]}), .B(pp1), .cin(1'b0), .S(sum1[3:0]), .cout(c_out1));
    assign p[1]=sum1[0]; 


    wire [3:0] sum2;
    wire c_out2;
    RCA_4bit rca2(.A({c_out1, sum1[3:1]}), .B(pp2), .cin(1'b0), .S(sum2[3:0]), .cout(c_out2));
    assign p[2] = sum2[0]; 

 
    
    RCA_4bit rca3(.A({c_out2, sum2[3:1]}), .B(pp3), .cin(1'b0), .S(p[6:3]), .cout(p[7]));
    
endmodule
