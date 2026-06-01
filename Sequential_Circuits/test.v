module test;

    reg A, B, C, D;
    wire W, X, Y, Z;

    // Instantiate the converter
    converter uut(.A(A), .B(B), .C(C), .D(D), .W(W), .X(X), .Y(Y), .Z(Z));

    initial begin
        // Test each value 0-9 manually
        // Decimal 0
        A = 0; B = 0; C = 0; D = 0; #1;
        $display("Input: %b%b%b%b  Output: %b%b%b%b", A,B,C,D,W,X,Y,Z);

        // Decimal 1
        A = 0; B = 0; C = 0; D = 1; #1;
        $display("Input: %b%b%b%b  Output: %b%b%b%b", A,B,C,D,W,X,Y,Z);

        // Decimal 2
        A = 0; B = 0; C = 1; D = 0; #1;
        $display("Input: %b%b%b%b  Output: %b%b%b%b", A,B,C,D,W,X,Y,Z);

        // Decimal 3
        A = 0; B = 0; C = 1; D = 1; #1;
        $display("Input: %b%b%b%b  Output: %b%b%b%b", A,B,C,D,W,X,Y,Z);

        // Decimal 4
        A = 0; B = 1; C = 0; D = 0; #1;
        $display("Input: %b%b%b%b  Output: %b%b%b%b", A,B,C,D,W,X,Y,Z);

        // Decimal 5
        A = 0; B = 1; C = 0; D = 1; #1;
        $display("Input: %b%b%b%b  Output: %b%b%b%b", A,B,C,D,W,X,Y,Z);

        // Decimal 6
        A = 0; B = 1; C = 1; D = 0; #1;
        $display("Input: %b%b%b%b  Output: %b%b%b%b", A,B,C,D,W,X,Y,Z);

        // Decimal 7
        A = 0; B = 1; C = 1; D = 1; #1;
        $display("Input: %b%b%b%b  Output: %b%b%b%b", A,B,C,D,W,X,Y,Z);

        // Decimal 8
        A = 1; B = 0; C = 0; D = 0; #1;
        $display("Input: %b%b%b%b  Output: %b%b%b%b", A,B,C,D,W,X,Y,Z);

        // Decimal 9
        A = 1; B = 0; C = 0; D = 1; #1;
        $display("Input: %b%b%b%b  Output: %b%b%b%b", A,B,C,D,W,X,Y,Z);

        $finish;
    end
endmodule

