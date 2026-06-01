
module array_multiplier_4bit(
    input [3:0] A, B,
    output [7:0] P
);
    wire [3:0] pp0, pp1, pp2, pp3; 
    wire [3:0] sum1, sum2, sum3;
    wire c1, c2, c3;

    
    assign pp0 = A & {4{B[0]}};
    assign pp1 = A & {4{B[1]}};
    assign pp2 = A & {4{B[2]}};
    assign pp3 = A & {4{B[3]}};

    ripple_carry_adder rca1(
        .a({1'b0, pp0[3:1]}), 
        .b(pp1), 
        .cin(0), 
        .sum(sum1), 
        .cout(c1)
    );

    ripple_carry_adder rca2(
        .a({c1, sum1[3:1]}), 
        .b(pp2), 
        .cin(0), 
        .sum(sum2), 
        .cout(c2)
    );

    ripple_carry_adder rca3(
        .a({c2, sum2[3:1]}), 
        .b(pp3), 
        .cin(0), 
        .sum(sum3), 
        .cout(c3)
    );

    assign P[0] = pp0[0];
    assign P[1] = sum1[0];
    assign P[2] = sum2[0];
    assign P[6:3] = sum3;
    assign P[7] = c3;

endmodule

