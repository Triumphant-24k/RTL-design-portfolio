
module array_mul(
    input  [3:0] A,
    input  [3:0] B,
    output [7:0] P
);
    // 4-bit Partial products
    wire [3:0] pp0 = (A & {4{B[0]}});
    wire [3:0] pp1 = (A & {4{B[1]}});
    wire [3:0] pp2 = (A & {4{B[2]}});
    wire [3:0] pp3 = (A & {4{B[3]}});

    // Align partial products via shifting in the adders
    // Stage 1: pp0 + (pp1 << 1)
    wire [4:0] sum1; // Need 5-bit to hold carry
    wire c_out1;
    RCA_4bit rca1(.A({1'b0, pp0[3:1]}), .B(pp1), .cin(1'b0), .S(sum1[4:1]), .cout(c_out1));
    assign sum1[0] = pp0[0]; // LSB unchanged from pp0

    // Stage 2: sum1 + (pp2 << 2)
    wire [5:0] sum2;
    wire c_out2;
    RCA_4bit rca2(.A({1'b0, sum1[4:2]}), .B(pp2), .cin(1'b0), .S(sum2[5:2]), .cout(c_out2));
    assign sum2[1:0] = sum1[1:0]; // lower bits carried forward

    // Stage 3: sum2 + (pp3 << 3)
    wire [6:0] sum3;
    wire c_out3;
    RCA_4bit rca3(.A({1'b0, sum2[5:3]}), .B(pp3), .cin(1'b0), .S(sum3[6:3]), .cout(c_out3));
    assign sum3[2:0] = sum2[2:0];

    // Final output
    assign P = {c_out3, sum3}; // sum3 is 7 bits, c_out3 is MSB

endmodule