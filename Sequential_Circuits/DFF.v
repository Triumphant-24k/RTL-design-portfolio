module DFF (output reg Q, input D, Clk, rst);
    always @ (posedge Clk, negedge rst)
        if (!rst) Q <= 1'b0; // Synchronous reset
        else Q <= D;
endmodule

