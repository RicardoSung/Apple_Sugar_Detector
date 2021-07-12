`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:48:07 06/28/2021 
// Design Name: 
// Module Name:    UART_TX_Sequence 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module UART_TX_Sequence
#(
    parameter clk_FRE = 50,
	parameter BAUD_RATE = 115200
)(
    input clk_50m,
    input start,
    input [3699:0]spectrum_values,
    output tx_pin
);



    localparam IDLE =  0;
    localparam SEND =  1;
    localparam WAIT =  2;
    reg[7:0] tx_data;
    // reg[7:0] tx_str;
    reg tx_data_valid;
    wire tx_data_ready;
    reg[11:0] tx_cnt;
    reg[31:0] wait_cnt;
    reg[3:0] state;
    reg [7329:0]spectrum_values_reg;

    always @(*) begin
        spectrum_values_reg <= spectrum_values;
    end





    always@(posedge clk_50m or negedge start)
        begin
            if(start == 1'b0)
            begin
                wait_cnt <= 32'd0;
                tx_data <= 8'd0;
                state <= IDLE;
                tx_cnt <= 8'd0;
                tx_data_valid <= 1'b0;
            end
            else
            case(state)
                IDLE:
                    state <= SEND;
                SEND:
                begin
                    wait_cnt <= 32'd0;
                    // tx_data <= tx_str;
                    // tx_data <= spectrum_values[tx_cnt/2][((tx_cnt%2)*8):((tx_cnt%2+1)*8)];
                    tx_data <= spectrum_values_reg[tx_cnt%2*8+:8];
                    //the first [] means the number of spectrum_value-arrays, 
                    //the second one means the bits
                    if(tx_data_valid == 1'b1 && tx_data_ready == 1'b1 && tx_cnt < 12'd3650)//Send 12 bytes data
                    begin
                        tx_cnt <= tx_cnt + 8'd1; //Send data counter
                    end
                    else if(tx_data_valid && tx_data_ready)//last byte sent is complete
                    begin
                        tx_cnt <= 8'd0;
                        tx_data_valid <= 1'b0;
                        state <= WAIT;
                    end
                    else if(~tx_data_valid)
                    begin
                        tx_data_valid <= 1'b1;
                    end
                end
                WAIT:
                begin
                    wait_cnt <= wait_cnt + 32'd1;
                    if(wait_cnt >= clk_FRE * 1000000) // wait for 1 second
                        state <= SEND;
                end
                default:
                    state <= IDLE;
            endcase
        end



    UART_TX#
    (
        .CLK_FRE(clk_FRE),
        .BAUD_RATE(BAUD_RATE)
    ) uart_tx_inst
    (
        .clk_50m (clk_50m),
        .start (start),
        .tx_data (tx_data),
        .tx_data_valid (tx_data_valid),
        .tx_data_ready (tx_data_ready),
        .tx_pin (tx_pin)
    );


endmodule
