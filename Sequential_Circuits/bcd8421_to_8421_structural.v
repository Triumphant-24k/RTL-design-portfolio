module bcd8421_to_8421_structural (
  input A, B, C, D,
  output W, X, Y, Z
);

  wire notB, notC, notD;
  wire b0, b1, b2, b3, b4, b5, b6;

  not (notC, C);

  and (b0, B, C);          // B·C
  and (b1, B, notC);       // B·C'
  or  (W, A, b0);          // W = A + B·C
  or  (X, A, b1);          // X = A + B·C'
  assign Y = b0;           // Y = B·C
  assign Z = D;            // Z = D

endmodule

