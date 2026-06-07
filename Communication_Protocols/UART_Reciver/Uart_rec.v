module uart_rx(
    input clk,
    input reset,
    input rx,
    output reg [7:0] data_out,
    output reg rx_done
);

parameter CLKS_PER_BIT = 10;

reg [1:0] state;
reg [7:0] clk_count;
reg [2:0] bit_index;
reg [7:0] rx_data;

parameter IDLE  = 2'b00;
parameter START = 2'b01;
parameter DATA  = 2'b10;
parameter STOP  = 2'b11;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= IDLE;
        clk_count <= 0;
        bit_index <= 0;
        rx_data <= 0;
        data_out <= 0;
        rx_done <= 0;
    end else begin
        case (state)

            IDLE: begin
                rx_done <= 0;
                clk_count <= 0;
                bit_index <= 0;

                if (rx == 0)
                    state <= START;
            end

            START: begin
                if (clk_count == (CLKS_PER_BIT/2)) begin
                    if (rx == 0) begin
                        clk_count <= 0;
                        state <= DATA;
                    end else begin
                        state <= IDLE;
                    end
                end else begin
                    clk_count <= clk_count + 1;
                end
            end

            DATA: begin
                if (clk_count < CLKS_PER_BIT - 1) begin
                    clk_count <= clk_count + 1;
                end else begin
                    clk_count <= 0;
                    rx_data[bit_index] <= rx;

                    if (bit_index < 7) begin
                        bit_index <= bit_index + 1;
                    end else begin
                        bit_index <= 0;
                        state <= STOP;
                    end
                end
            end

            STOP: begin
                if (clk_count < CLKS_PER_BIT - 1) begin
                    clk_count <= clk_count + 1;
                end else begin
                    clk_count <= 0;
                    data_out <= rx_data;
                    rx_done <= 1;
                    state <= IDLE;
                end
            end

        endcase
    end
end

endmodule
