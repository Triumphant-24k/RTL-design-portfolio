module uart_tx(
    input clk,
    input reset,
    input tx_start,
    input [7:0] data_in,
    output reg tx,
    output reg tx_busy
);

parameter CLKS_PER_BIT = 10;

reg [1:0] state;
reg [7:0] clk_count;
reg [2:0] bit_index;
reg [7:0] tx_data;

parameter IDLE  = 2'b00;
parameter START = 2'b01;
parameter DATA  = 2'b10;
parameter STOP  = 2'b11;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= IDLE;
        tx <= 1'b1;
        tx_busy <= 1'b0;
        clk_count <= 0;
        bit_index <= 0;
        tx_data <= 0;
    end else begin
        case (state)

            IDLE: begin
                tx <= 1'b1;
                tx_busy <= 1'b0;
                clk_count <= 0;
                bit_index <= 0;

                if (tx_start) begin
                    tx_data <= data_in;
                    tx_busy <= 1'b1;
                    state <= START;
                end
            end

            START: begin
                tx <= 1'b0;

                if (clk_count < CLKS_PER_BIT - 1)
                    clk_count <= clk_count + 1;
                else begin
                    clk_count <= 0;
                    state <= DATA;
                end
            end

            DATA: begin
                tx <= tx_data[bit_index];

                if (clk_count < CLKS_PER_BIT - 1)
                    clk_count <= clk_count + 1;
                else begin
                    clk_count <= 0;

                    if (bit_index < 7)
                        bit_index <= bit_index + 1;
                    else begin
                        bit_index <= 0;
                        state <= STOP;
                    end
                end
            end

            STOP: begin
                tx <= 1'b1;

                if (clk_count < CLKS_PER_BIT - 1)
                    clk_count <= clk_count + 1;
                else begin
                    clk_count <= 0;
                    tx_busy <= 1'b0;
                    state <= IDLE;
                end
            end

        endcase
    end
end

endmodule
