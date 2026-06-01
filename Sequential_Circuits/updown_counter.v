module updown_counter(
input clk,
input rst,
input en,
input up_down,
output reg [3:0] count
);

always @(posedge clk or posedge rst)
begin
if(rst)
count <= 4'd0;
else if(en)
begin
if(up_down)
count <= count + 4'd1;
else
count <= count - 4'd1;
end
end

endmodule
