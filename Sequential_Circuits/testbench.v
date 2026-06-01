module testbench;
    reg  [3:0] in;      // 8421 input
    wire [3:0] out;     // 84-2-1 output

    // Instantiate the converter (behavioral model)
    Behave uut (
        .in(in),
        .out(out)
    );

    initial begin
        $display("8421  | 84-2-1");
        $display("------+--------");

        for (in = 0; in < 10; in = in + 1) begin
            #10;
            $display("%b | %b", in, out);
        end

        $finish;
    end
endmodule

