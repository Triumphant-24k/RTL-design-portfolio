`include "JKFF.v"
module counter(output [3:0] Q, input Clk, input rst);
wire JA, KA, JB, KB, JC, KC, JD, KD;
wire QA, QB, QC, QD;
assign Q = {QA, QB, QC, QD};
assign JD = ~QA;
assign KD = 1'b1;
assign JC = QD;
assign KC = QD;
assign JB = QC & QD;
assign KB = QC & QD;
assign JA = QB & QC & QD;
assign KA = 1'b1;

wire detect9 = (QA & ~QB & ~QC & QD);
JKFF FF_A(QA, JA, KA, Clk, ~(detect9 | ~rst));
JKFF FF_B(QB, JB, KB, Clk, ~(detect9 | ~rst));
JKFF FF_C(QC, JC, KC, Clk, ~(detect9 | ~rst));
JKFF FF_D(QD, JD, KD, Clk, ~(detect9 | ~rst));
endmodule
