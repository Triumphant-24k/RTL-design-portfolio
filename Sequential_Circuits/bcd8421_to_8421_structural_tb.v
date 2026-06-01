module bcd8421_to_8421_structural_tb;

  reg A, B, C, D;
  wire W, X, Y, Z;

  bcd8421_to_8421_structural dut (
    .A(A), .B(B), .C(C), .D(D),
    .W(W), .X(X), .Y(Y), .Z(Z)
  );

  integer i;
  reg [3:0] in;

  initial begin
    $display("8421 BCD to 84-2-1 Output");
    for (i = 0; i < 10; i = i + 1) begin
      in = i;
      {A, B, C, D} = in;
      #10;
      $display("Input: %b -> Output: %b%b%b%b", in, W, X, Y, Z);
    end
    $finish;
  end

endmodule

