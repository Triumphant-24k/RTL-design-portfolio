module converter(
    input A, B, C, D,
    output W, X, Y, Z
);

// NOT gates
wire nA, nB, nC;
not u1(nA, A);
not u2(nB, B);
not u3(nC, C);

// AND gates for X
wire w1, w2;
and u3a(w1, B, nA);
and u3b(w2, A, nB);
// OR gate for X
or u4(X, w1, w2);

// AND gates for Y
wire w3, w4;
and u5(w3, C, nA);
and u6(w4, A, nC);
// OR gate for Y
or u7(Y, w3, w4);

// Direct assign
assign W = A;
assign Z = D;

endmodule

