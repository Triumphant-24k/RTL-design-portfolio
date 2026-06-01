module bcd_counter (
    input clk,
    input rst,
    input en,
    output reg [3:0] count
);

always @(posedge clk or posedge rst) begin
    if (rst)
        count <= 4'd0;
    else if (en) begin
        if (count == 4'd9)
            count <= 4'd0;
        else
            count <= count + 4'd1;
    end
end

endmodule
