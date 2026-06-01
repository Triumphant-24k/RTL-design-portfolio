module FSM_1010_Mealy(
    input Clk, Rst, X,
    output reg Y
);

parameter S0 = 2'b00, S1 = 2'b01,
          S2 = 2'b10, S3 = 2'b11;

reg [1:0] CurrentState, NextState;

// State Register
always @(posedge Clk or posedge Rst)
begin
    if (Rst)
        CurrentState <= S0;
    else
        CurrentState <= NextState;
end

// Next-State and Mealy Output Logic
always @(CurrentState, X)
begin
    Y = 0;
    case (CurrentState)
        S0: if (X) NextState = S1; else NextState = S0;

        S1: if (X) NextState = S1; else NextState = S2;

        S2: if (X) NextState = S3; else NextState = S0;

        S3:
            if (!X) begin
                NextState = S2; 
                Y = 1;          // Sequence 1010 detected
            end
            else
                NextState = S1;

        default: NextState = S0;
    endcase
end
endmodule

